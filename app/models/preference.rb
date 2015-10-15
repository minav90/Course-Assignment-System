class Preference < ActiveRecord::Base
	belongs_to :day_combination
	belongs_to :building
	belongs_to :time_slot
	has_manys :faculty_preferences, :foreign_key => 'preference1_id', :dependent => :destroy
	has_manys :faculty_preferences, :foreign_key => 'preference2_id', :dependent => :destroy 
	has_manys :faculty_preferences, :foreign_key => 'preference3_id', :dependent => :destroy
end
