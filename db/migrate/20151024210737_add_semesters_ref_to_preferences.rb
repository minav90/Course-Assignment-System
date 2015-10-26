class AddSemestersRefToPreferences < ActiveRecord::Migration
  def change
    add_reference :preferences, :semester, index: true, foreign_key: true
  end
end
