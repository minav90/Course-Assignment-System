class CreateDayCombinations < ActiveRecord::Migration
  def change
    create_table :day_combinations do |t|
      t.string :day_combination

      t.timestamps null: false
    end
  end
end
