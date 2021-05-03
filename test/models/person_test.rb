# == Schema Information
#
# Table name: people
#
#  id              :bigint           not null, primary key
#  annual_income   :float
#  birth_date      :date
#  email           :string
#  favorite_color  :string
#  first_name      :string
#  last_name       :string
#  string          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_people_on_organization_id  (organization_id)
#
require "test_helper"

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
