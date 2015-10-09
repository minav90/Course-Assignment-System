class AddCoursesRefToFacultyToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :courses, index: true, foreign_key: true
  end
end
