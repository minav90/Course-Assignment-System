class AddPreferences3RefToFacultyPreferences < ActiveRecord::Migration
  def change
    add_reference :faculty_preferences, :preference3, index: true, foreign_key: true
  end
end
