class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :addressable_id
      t.string :addressable_type
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state_or_region
      t.string :postal_code
      t.timestamp :deleted_at

      t.timestamps
    end

    add_index :addresses, %i[addressable_type addressable_id]
  end
end
