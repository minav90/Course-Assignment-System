class FacultyCoursesController < ApplicationController
    def index
        @faculties = Faculty.all
	    @all_faculty = Hash.new
        FacultyCourse.all.each do |faculty_course|
        @faculty = Faculty.find_by_id(faculty_course.faculty_id)
		course1 = Course.where(:id => faculty_course.course1_id).pluck(:course_name)[0]
		course2 = Course.where(:id => faculty_course.course2_id).pluck(:course_name)[0]
		course3 = Course.where(:id => faculty_course.course3_id).pluck(:course_name)[0]
		@all_faculty[@faculty.id] = {:faculty_name => @faculty.faculty_name, :course1 => course1, :course2 => course2, :course3 => course3}
	end
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
