class AddFacultiesRefToFacultyCourses < ActiveRecord::Migration
  def change
    add_reference :faculty_courses, :faculty, index: true, foreign_key: true
  end
end
