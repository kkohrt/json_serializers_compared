class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.integer :phonable_id
      t.string :phonable_type
      t.string :classification, default: 'cell_phone'
      t.string :nickname
      t.boolean :can_text, default: false
      t.boolean :can_call, default: true
      t.timestamp :disabled_at
      t.boolean :shared, default: false
      t.integer :priority, default: 0
      t.string :number
      t.string :extension

      t.timestamps
    end
    add_index :phones, %i[phonable_type phonable_id]
  end
end
