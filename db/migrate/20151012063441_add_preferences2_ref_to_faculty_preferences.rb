class AddPreferences2RefToFacultyPreferences < ActiveRecord::Migration
  def change
    add_reference :faculty_preferences, :preference2, index: true, foreign_key: true
  end
end
