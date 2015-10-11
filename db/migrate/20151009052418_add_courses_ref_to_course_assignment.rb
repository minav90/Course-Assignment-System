class AddCoursesRefToCourseAssignment < ActiveRecord::Migration
  def change
    add_reference :course_assignments, :courses, index: true, foreign_key: true
  end
end
