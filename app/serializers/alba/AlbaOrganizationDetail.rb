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
class AlbaOrganizationDetail
  include ::Alba::Resource

  key :organization

  attributes :id,
             :description,
             :name_displayed,
             :name_internal,
             :ukey

  many :people, resource: AlbaPersonList
  many :phones, resource: AlbaPhoneDetail
  many :addresses, resource: AlbaAddressDetail
  many :comments, resource: AlbaCommentList
end
