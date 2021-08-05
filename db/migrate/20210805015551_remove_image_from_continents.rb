class RemoveImageFromContinents < ActiveRecord::Migration[6.1]
  def change
    remove_column :continents, :image, :string
  end
end
