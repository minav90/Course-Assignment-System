class CreateCourseAssignments < ActiveRecord::Migration
  def change
    create_table :course_assignments do |t|

      t.timestamps null: false
    end
  end
end
