class AddFacultiesRefToCourseAssignment < ActiveRecord::Migration
  def change
    add_reference :course_assignments, :faculties, index: true, foreign_key: true
  end
end
