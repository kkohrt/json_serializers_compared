# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  comment          :text
#  commentable_type :string
#  reviewed         :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  person_id        :integer
#
class AlbaCommentList
  include ::Alba::Resource

  key :comment

  attributes :id,
             :comment,
             :reviewed,
             :created_at,
             :updated_at,
             :person_id,
             :commentable_type,
             :commentable_id

  one :person, resource: AlbaPersonList

  one :commentable do
    attribute :name_displayed do |resource|
      case resource
      when Person
        "#{resource.first_name} #{resource.last_name}"
      when Organization
        resource.name_displayed
      when Comment
        "Comment #{resource.created_at.strftime("%Y-%m-%d")}"
      else
        resource.class.name
      end
    end
  end
end
