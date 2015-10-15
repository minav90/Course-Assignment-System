class DayCombination < ActiveRecord::Base
	has_many :course_assignments
	has_many :preferences
end
