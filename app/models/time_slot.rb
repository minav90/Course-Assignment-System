class TimeSlot < ActiveRecord::Base
	has_many :course_assignments, :dependent => :destroy
	has_many :classroom_timings, :dependent => :destroy
	has_many :preferences, :dependent => :destroy
	has_many :faculty_preferences, :through => :preferences, :dependent => :destroy
	belongs_to :day_combination
end
