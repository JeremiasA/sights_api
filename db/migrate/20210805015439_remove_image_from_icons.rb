class RemoveImageFromIcons < ActiveRecord::Migration[6.1]
  def change
    remove_column :icons, :image, :string
  end
end
