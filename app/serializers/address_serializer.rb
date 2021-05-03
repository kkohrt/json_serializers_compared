# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  addressable_type :string
#  city             :string
#  deleted_at       :datetime
#  postal_code      :string
#  state_or_region  :string
#  street1          :string
#  street2          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :integer
#
# Indexes
#
#  index_addresses_on_addressable_type_and_addressable_id  (addressable_type,addressable_id)
#
class AddressSerializer
  include JSONAPI::Serializer

  attributes :id,
             :city,
             :deleted_at,
             :postal_code,
             :state_or_region,
             :street1,
             :street2,
             :addressable_type,
             :addressable_id,
             :updated_at
end
