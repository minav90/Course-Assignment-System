class FacultyCourse < ActiveRecord::Base
	belongs_to :faculty
	belongs_to :course1, :class_name => 'Course'
	belongs_to :course2, :class_name => 'Course'
	belongs_to :course3, :class_name => 'Course'
	belongs_to :semester
	has_many :faculty_preferences, :dependent => :destroy

	def facultyname
		faculty.faculty_name
	end 

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |faccourse|
				csv << faccourse.attributes.values_at(*column_names)
			end
		end
	end
end
