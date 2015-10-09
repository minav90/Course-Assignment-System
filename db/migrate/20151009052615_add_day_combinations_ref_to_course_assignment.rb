class AddDayCombinationsRefToCourseAssignment < ActiveRecord::Migration
  def change
    add_reference :course_assignments, :daycombinations, index: true, foreign_key: true
  end
end
