class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.references :organization
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birth_date
      t.string :favorite_color
      t.string :string
      t.float :annual_income

      t.timestamps
    end
  end
end
