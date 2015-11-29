class Preference < ActiveRecord::Base
	belongs_to :day_combination
	belongs_to :building
	belongs_to :time_slot
	belongs_to :semester
	has_one :faculty_preference, :foreign_key => 'preference1_id', :dependent => :destroy, :class_name => "FacultyPreference"
	has_one :other_faculty_preference, :foreign_key => 'preference2_id', :dependent => :destroy, :class_name => "FacultyPreference"
	has_one :other_faculty_preference, :foreign_key => 'preference3_id', :dependent => :destroy, :class_name => "FacultyPreference"
end

