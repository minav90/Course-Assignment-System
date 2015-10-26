class CreateFacultyCourses < ActiveRecord::Migration
  def change
    create_table :faculty_courses do |t|
      t.integer :course1_id
      t.integer :course2_id
      t.integer :course3_id

      t.timestamps null: false
    end
  end
end
