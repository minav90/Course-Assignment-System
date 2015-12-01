class FacultyCourse < ActiveRecord::Base
	belongs_to :faculty
	belongs_to :course1, :class_name => 'Course'
	belongs_to :course2, :class_name => 'Course'
	belongs_to :course3, :class_name => 'Course'
	belongs_to :semester
	has_many :faculty_preferences, :dependent => :destroy
end
