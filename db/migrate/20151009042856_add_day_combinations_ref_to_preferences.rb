class AddDayCombinationsRefToPreferences < ActiveRecord::Migration
  def change
    add_reference :preferences, :daycombinations, index: true, foreign_key: true
  end
end
