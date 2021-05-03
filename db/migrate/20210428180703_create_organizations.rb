class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name_displayed
      t.string :name_internal
      t.string :ukey
      t.text :description

      t.timestamps
    end
  end
end
