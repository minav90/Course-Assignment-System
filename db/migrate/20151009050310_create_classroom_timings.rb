class CreateClassroomTimings < ActiveRecord::Migration
  def change
    create_table :classroom_timings do |t|

      t.timestamps null: false
    end
  end
end
