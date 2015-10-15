class Preference < ActiveRecord::Base
	belongs_to :day_combination
	belongs_to :building
	belongs_to :time_slot
	has_many :faculty_preferences, :foreign_key => 'preference1_id', :dependent => :destroy
	has_many :faculty_preferences, :foreign_key => 'preference2_id', :dependent => :destroy 
	has_many :faculty_preferences, :foreign_key => 'preference3_id', :dependent => :destroy
end
