class CreateIcons < ActiveRecord::Migration[6.1]
  def change
    create_table :icons do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.date :created, null: false
      t.integer :height, null: false
      t.string :history, null: false

      t.timestamps
    end
  end
end
