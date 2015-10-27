class CourseAssignment < ActiveRecord::Base
	belongs_to :course
	belongs_to :faculty
	belongs_to :room
	belongs_to :day_combination
	belongs_to :time_slot
	belongs_to :semester
end
