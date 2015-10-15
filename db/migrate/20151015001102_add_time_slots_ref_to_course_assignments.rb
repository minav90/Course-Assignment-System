class AddTimeSlotsRefToCourseAssignments < ActiveRecord::Migration
  def change
    add_reference :course_assignments, :time_slot, index: true, foreign_key: true
  end
end
