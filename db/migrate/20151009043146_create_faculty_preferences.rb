class CreateFacultyPreferences < ActiveRecord::Migration
  def change
    create_table :faculty_preferences do |t|

      t.timestamps null: false
    end
  end
end
