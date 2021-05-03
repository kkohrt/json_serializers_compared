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
class PersonBlueprint < Blueprinter::Base

  fields :id

  view :list do
    fields :first_name,
           :last_name
    association :organization, blueprint: OrganizationBlueprint
  end

  view :name_only do
    field :full_name do |person, _options|
      "#{person.first_name} #{person.last_name}"
    end
  end

  view :detail do
    include_view :list
    fields :annual_income,
           :birth_date,
           :email,
           :favorite_color,
           :string,
           :created_at
    association :phones, blueprint: PhoneBlueprint
    association :addresses, blueprint: AddressBlueprint
  end

  view :comments do
    include_view :detail
    association :comments, blueprint: CommentBlueprint, view: :details
  end
end
