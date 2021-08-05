class CreateIconCities < ActiveRecord::Migration[6.1]
  def change
    create_table :icon_cities do |t|
      t.references :icon, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
