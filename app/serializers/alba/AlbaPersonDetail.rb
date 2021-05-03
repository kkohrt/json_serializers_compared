# frozen_string_literal: true

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
class AlbaPersonDetail
  include ::Alba::Resource

  key :person

  attributes :id,
             :annual_income,
             :birth_date,
             :email,
             :favorite_color,
             :first_name,
             :last_name,
             :string,
             :created_at

  one :organization, resource: AlbaOrganizationList
  many :phones, resource: AlbaPhoneDetail
  many :addresses, resource: AlbaAddressDetail
  many :comments, resource: AlbaCommentList
end
