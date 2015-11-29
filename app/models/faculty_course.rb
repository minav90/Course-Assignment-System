class FacultyCourse < ActiveRecord::Base
	belongs_to :faculty
	belongs_to :course
	belongs_to :semester
	has_many :faculty_preferences, :dependent => :destroy

	def facultyname
		faculty.faculty_name
	end 
end
