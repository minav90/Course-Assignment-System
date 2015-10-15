class AddBuildingsRefToRooms < ActiveRecord::Migration
  def change
    add_reference :rooms, :building, index: true, foreign_key: true
  end
end
