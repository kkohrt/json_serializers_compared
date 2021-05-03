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
class Person < ApplicationRecord
  belongs_to :organization
  has_many :phones, as: :phonable, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :comments, dependent: :destroy
end
