class FacultyCoursesController < ApplicationController
    def index
	@faculties = Faculty.all()
    end

    def select_faculty
	if params[:faculty_id] != ""
		faculty_course = FacultyCourse.find_by_faculty_id(params[:faculty_id])
		if faculty_course == nil
			params[:course1_id] = ""
			params[:course2_id] = ""
			params[:course3_id] = ""
			faculty_course = FacultyCourse.create!(params.permit(:faculty_id,:course1_id,:course2_id,:course3_id))
		end
    		redirect_to faculty_course_path(faculty_course)
	else
		flash[:notice] = "No faculty selected"
		redirect_to faculty_courses_path
	end
    end

    def show
	@faculty_course = FacultyCourse.find(params[:id])
	@faculty = Faculty.find(@faculty_course.faculty_id)
	@courses = Course.all()
    end

    def edit
    	faculty_course = FacultyCourse.find(params[:id])
	faculty_course.update_attributes!(params[:courses].permit(:course1_id,:course2_id,:course3_id))
	flash[:notice] = "Courses information updated successfully"
	redirect_to faculty_courses_path
    end
end	
