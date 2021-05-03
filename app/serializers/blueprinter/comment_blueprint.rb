class CommentBlueprint < Blueprinter::Base
  fields :id,
         :comment,
         :reviewed,
         :created_at,
         :updated_at,
         :person_id,
         :commentable_type,
         :commentable_id


  association :person, blueprint: PersonBlueprint, view: :list
  view :details do

    field :commentable do |comment, options|
      # data = case comment.commentable_type
      #   when 'Person'
      #     PersonBlueprint.render(comment.commentable, view: :name_only)
      #   when 'Organization'
      #     OrganizationBlueprint.render(comment.commentable)
      #   else
      #     { comment.commentable_type => comment.commentable_id }
      #   end
      # { comment.commentable_type => data }
      commentable = comment.commentable
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

  # view :details do
  #   fields :comment,
  #          :reviewed

  #   association :commentable, default: {}, blueprint: ->(thing) {
  #     case thing
  #     when Person
  #       PersonBlueprint
  #     when Organization
  #       OrganizationBlueprint
  #     when Comment
  #       CommentBlueprint
  #     end
  #   }
  # end
end
