class AddTimeSlotsRefToPreferences < ActiveRecord::Migration
  def change
    add_reference :preferences, :time_slot, index: true, foreign_key: true
  end
end
