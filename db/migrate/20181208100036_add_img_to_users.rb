class AddImgToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ima, :string
  end
end
