class CreateTimeRanges < ActiveRecord::Migration
  def change
    create_table :time_ranges do |t|
      t.string :t_range
      t.string :t_slots

      t.timestamps null: false
    end
  end
end
