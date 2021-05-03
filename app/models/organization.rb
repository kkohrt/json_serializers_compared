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
class Organization < ApplicationRecord
  has_many :people, dependent: :destroy
  has_many :phones, as: :phonable, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
