class ChangePasswordDiggestName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :password_diggest, :password_digest
  end
end
