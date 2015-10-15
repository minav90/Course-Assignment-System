class AddBuildingsRefToPreferences < ActiveRecord::Migration
  def change
    add_reference :preferences, :building, index: true, foreign_key: true
  end
end
