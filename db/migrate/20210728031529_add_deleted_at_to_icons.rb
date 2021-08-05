class AddDeletedAtToIcons < ActiveRecord::Migration[6.1]
  def change
    add_column :icons, :deleted_at, :datetime
    add_index :icons, :deleted_at
  end
end
