class AddCoursesRefToCourseAssignments < ActiveRecord::Migration
  def change
    add_reference :course_assignments, :course, index: true, foreign_key: true
  end
end
