class AddTimeSlotsRefToCourseAssignment < ActiveRecord::Migration
  def change
    add_reference :course_assignments, :timeslots, index: true, foreign_key: true
  end
end
