class AddDayCombinationsRefToClassroomTimings < ActiveRecord::Migration
  def change
    add_reference :classroom_timings, :day_combination, index: true, foreign_key: true
  end
end
