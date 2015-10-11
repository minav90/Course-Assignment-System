class AddTimeSlotsRefToClassroomTimings < ActiveRecord::Migration
  def change
    add_reference :classroom_timings, :timeslots, index: true, foreign_key: true
  end
end
