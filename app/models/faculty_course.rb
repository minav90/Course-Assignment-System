class FacultyCourse < ActiveRecord::Base
	belongs_to :faculty
	belongs_to :course
	
end
