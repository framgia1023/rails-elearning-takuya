class RenameImaColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :ima, :img
  end
end
