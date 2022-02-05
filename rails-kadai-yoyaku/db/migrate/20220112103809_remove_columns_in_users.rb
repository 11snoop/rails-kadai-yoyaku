class RemoveColumnsInUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :room_name, :string
    remove_column :users, :room_introduction, :text
    remove_column :users, :room_price, :integer
    remove_column :users, :room_address, :string
    remove_column :users, :room_image, :string
  end
end
