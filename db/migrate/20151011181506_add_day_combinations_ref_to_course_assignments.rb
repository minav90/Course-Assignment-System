class AddDayCombinationsRefToCourseAssignments < ActiveRecord::Migration
  def change
    add_reference :course_assignments, :day_combination, index: true, foreign_key: true
  end
end
