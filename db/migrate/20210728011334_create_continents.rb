class CreateContinents < ActiveRecord::Migration[6.1]
  def change
    create_table :continents do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
