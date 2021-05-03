# frozen_string_literal: true

# == Schema Information
#
# Table name: phones
#
#  id             :bigint           not null, primary key
#  can_call       :boolean          default(TRUE)
#  can_text       :boolean          default(FALSE)
#  classification :string           default("cell_phone")
#  disabled_at    :datetime
#  extension      :string
#  nickname       :string
#  number         :string
#  phonable_type  :string
#  priority       :integer          default(0)
#  shared         :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  phonable_id    :integer
#
# Indexes
#
#  index_phones_on_phonable_type_and_phonable_id  (phonable_type,phonable_id)
#
class PhoneSerializer
  include JSONAPI::Serializer
  attributes :id,
             :can_call,
             :can_text,
             :classification,
             :disabled_at,
             :extension,
             :nickname,
             :number,
             :priority,
             :shared,
             :updated_at,
             :phonable_type,
             :phonable_id
end
