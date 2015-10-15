class CreateFacultyCourses < ActiveRecord::Migration
  def change
    create_table :faculty_courses do |t|

      t.timestamps null: false
    end
  end
end
