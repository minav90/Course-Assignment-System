class AddRoomsRefToCourseAssignments < ActiveRecord::Migration
  def change
    add_reference :course_assignments, :room, index: true, foreign_key: true
  end
end
