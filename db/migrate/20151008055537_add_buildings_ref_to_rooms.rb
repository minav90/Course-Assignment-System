class AddBuildingsRefToRooms < ActiveRecord::Migration
  def change
    add_reference :rooms, :Buildings, index: true, foreign_key: true
  end
end
