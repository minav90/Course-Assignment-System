class AddSemestersRefToCourseAssignments < ActiveRecord::Migration
  def change
    add_reference :course_assignments, :semester, index: true, foreign_key: true
  end
end
