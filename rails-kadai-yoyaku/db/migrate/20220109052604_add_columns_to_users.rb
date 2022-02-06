class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :room_name, :string
    add_column :users, :room_introduction, :text
    add_column :users, :room_price, :integer
    add_column :users, :room_address, :string
    add_column :users, :room_image, :string
  end
end
