class Room < ActiveRecord::Base
	belongs_to :building
	has_many :classroom_timings, :dependent => :destroy
	has_many :course_assignments, :dependent => :destroy
end
