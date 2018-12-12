class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.integer :address, null: true
      t.timestamps
    end
  end
end
