class AddTimeSlotsRefToPreferences < ActiveRecord::Migration
  def change
    add_reference :preferences, :timeslots, index: true, foreign_key: true
  end
end
