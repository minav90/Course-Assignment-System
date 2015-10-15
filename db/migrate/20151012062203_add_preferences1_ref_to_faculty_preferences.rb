class AddPreferences1RefToFacultyPreferences < ActiveRecord::Migration
  def change
    add_reference :faculty_preferences, :preference1, index: true, foreign_key: true
  end
end
