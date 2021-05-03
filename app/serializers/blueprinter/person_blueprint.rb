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
