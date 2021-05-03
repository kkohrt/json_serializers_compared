# == Schema Information
#
# Table name: organizations
#
#  id             :bigint           not null, primary key
#  description    :text
#  name_displayed :string
#  name_internal  :string
#  ukey           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
