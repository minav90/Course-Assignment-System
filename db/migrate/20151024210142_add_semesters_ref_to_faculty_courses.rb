class AddSemestersRefToFacultyCourses < ActiveRecord::Migration
  def change
    add_reference :faculty_courses, :semester, index: true, foreign_key: true
  end
end
