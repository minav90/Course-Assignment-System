class AddFacultiesRefToCourseAssignments < ActiveRecord::Migration
  def change
    add_reference :course_assignments, :faculty, index: true, foreign_key: true
  end
end
