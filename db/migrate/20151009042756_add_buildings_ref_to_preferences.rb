class AddBuildingsRefToPreferences < ActiveRecord::Migration
  def change
    add_reference :preferences, :buildings, index: true, foreign_key: true
  end
end
