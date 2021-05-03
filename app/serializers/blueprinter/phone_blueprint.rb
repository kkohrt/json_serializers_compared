class PhoneBlueprint < Blueprinter::Base
  fields :id,
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
