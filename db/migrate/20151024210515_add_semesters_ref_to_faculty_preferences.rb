class AddSemestersRefToFacultyPreferences < ActiveRecord::Migration
  def change
    add_reference :faculty_preferences, :semester, index: true, foreign_key: true
  end
end
