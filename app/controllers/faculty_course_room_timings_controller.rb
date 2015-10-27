class FacultyCourseRoomTimingsController < ApplicationController
  def show

  end

  def index
	@faculties = Faculty.order(faculty_name: :desc)	
  end

  def update_faculty_details
	@faculty_course = FacultyCourse.find_by_faculty_id(params[:faculty_id])
	respond_to do |format|
		format.js
	end
  end
end
