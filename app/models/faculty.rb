class Faculty < ActiveRecord::Base
	has_many :faculty_courses
	has_many :courses_assignments
	has_many :faculty_prefences, :through => :faculty_courses, :dependent => :destroy
end
