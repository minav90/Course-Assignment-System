class AddDayCombinationsRefToTimeRanges < ActiveRecord::Migration
  def change
    add_reference :time_ranges, :day_combination, index: true, foreign_key: true
  end
end
