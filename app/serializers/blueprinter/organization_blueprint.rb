class OrganizationBlueprint < Blueprinter::Base
  fields :id,
				 :name_displayed,
         :ukey

  view :detail do
		fields :name_internal,
				   :description,
				   :created_at,
           :updated_at
    association :phones, blueprint: PhoneBlueprint
    association :addresses, blueprint: AddressBlueprint
  end

  view :staffed do
    include_view :detail
    association :people, blueprint: PersonBlueprint, view: :list
  end


  view :commented do
    include_view :detail
    association :comments, blueprint: CommentBlueprint, view: :details
  end

  view :the_works do
    include_view :detail
    association :people, blueprint: PersonBlueprint, view: :list
    association :comments, blueprint: CommentBlueprint, view: :details
  end
end
