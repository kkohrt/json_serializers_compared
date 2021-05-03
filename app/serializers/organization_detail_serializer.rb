# frozen_string_literal: true

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
class OrganizationDetailSerializer < OrganizationSerializer
  attributes :description,
             :name_internal

  has_many :people
  has_many :phones
  has_many :addresses
  has_many :comments

end
