class ClassroomTiming < ActiveRecord::Base
	belongs_to :time_slot
	belongs_to :room
	belongs_to :day_combination
	belongs_to :semester
end
