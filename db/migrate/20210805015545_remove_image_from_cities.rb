class RemoveImageFromCities < ActiveRecord::Migration[6.1]
  def change
    remove_column :cities, :image, :string
  end
end
