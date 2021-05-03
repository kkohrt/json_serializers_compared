class CommentSerializer
  include JSONAPI::Serializer
  attributes :id,
             :comment,
             :reviewed,
             :created_at,
             :updated_at,
             :person_id,
             :commentable_type,
             :commentable_id

  belongs_to :person

  # belongs_to :commentable, polymorphic: true
  attribute :commentable do |object|
      commentable = object.commentable
      data = case commentable
      when Person
        "#{commentable.first_name} #{commentable.last_name}"
      when Organization
        commentable.name_displayed
      when Comment
        "Comment #{commentable.created_at.strftime("%Y-%m-%d")}"
      else
        commentable.class.name
      end
      { 'name_displayed' => data }
  end

end
