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
class Comment < ApplicationRecord
  belongs_to :person
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  after_destroy :clean_up

  def clean_up
    return unless commentable_type == 'Comment'
    commentable.destroy
  end
end
