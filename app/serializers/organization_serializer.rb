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
class OrganizationSerializer
  include JSONAPI::Serializer
  set_type :organization

  attributes :id,
             :name_displayed,
             :ukey
end
