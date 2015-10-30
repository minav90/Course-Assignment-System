class AddDayCombinationsRefToPreferences < ActiveRecord::Migration
  def change
    add_reference :preferences, :day_combination, index: true, foreign_key: true
  end
end
