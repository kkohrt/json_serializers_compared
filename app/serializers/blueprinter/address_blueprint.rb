class AddressBlueprint < Blueprinter::Base
  fields :id,
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
