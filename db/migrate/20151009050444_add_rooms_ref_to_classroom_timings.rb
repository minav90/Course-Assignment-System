class AddRoomsRefToClassroomTimings < ActiveRecord::Migration
  def change
    add_reference :classroom_timings, :rooms, index: true, foreign_key: true
  end
end
