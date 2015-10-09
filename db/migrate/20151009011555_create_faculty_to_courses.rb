class CreateFacultyToCourses < ActiveRecord::Migration
  def change
    create_table :faculty_to_courses do |t|

      t.timestamps null: false
    end
  end
end
