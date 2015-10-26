class Building < ActiveRecord::Base
	has_many :rooms, :dependent => :destroy
	has_many :preferences, :dependent => :destroy
	has_many :course_assignments, :through => :rooms, :dependent => :destroy
	has_many :classroom_timings, :through => :rooms, :dependent => :destroy
	has_many :faculty_preferences, :through => :preferences, :dependent => :destroy
end
