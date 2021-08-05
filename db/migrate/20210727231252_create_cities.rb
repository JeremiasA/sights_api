class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.integer :habitants, null: false
      t.integer :surface, null: false

      t.timestamps
    end
  end
end
