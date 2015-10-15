class AddFacultyCoursesRefToFacultyPreferences < ActiveRecord::Migration
  def change
    add_reference :faculty_preferences, :faculty_course, index: true, foreign_key: true
  end
end
