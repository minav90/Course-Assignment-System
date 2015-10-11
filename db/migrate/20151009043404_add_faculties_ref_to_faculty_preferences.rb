class AddFacultiesRefToFacultyPreferences < ActiveRecord::Migration
  def change
    add_reference :faculty_preferences, :faculties, index: true, foreign_key: true
  end
end
