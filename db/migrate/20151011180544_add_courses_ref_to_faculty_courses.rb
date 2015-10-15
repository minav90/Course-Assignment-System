class AddCoursesRefToFacultyCourses < ActiveRecord::Migration
  def change
    add_reference :faculty_courses, :course, index: true, foreign_key: true
  end
end
