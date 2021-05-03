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
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
