class FacultyPreference < ActiveRecord::Base
	belongs_to :faculty_course
	belongs_to :preference
end
