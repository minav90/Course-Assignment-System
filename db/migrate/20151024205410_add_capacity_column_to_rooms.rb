class AddCapacityColumnToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :Capacity, :integer
  end
end
