class Semester < ActiveRecord::Base
	has_many :classroom_timings, :dependent => :destroy
	has_many :course_assignments, :dependent => :destroy
	has_many :faculty_courses, :dependent => :destroy
	has_many :faculty_preferences, :dependent => :destroy
	has_many :preferences, :dependent => :destroy
end
