class ClassroomTiming < ActiveRecord::Base
	belongs_to :time_slot
	belongs_to :room
end
