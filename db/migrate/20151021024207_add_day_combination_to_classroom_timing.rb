class AddDayCombinationToClassroomTiming < ActiveRecord::Migration
  def change
    add_column :classroom_timings, :day_combination_id, :string
  end
end
