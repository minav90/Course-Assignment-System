class FacultyCoursesController < ApplicationController
    def index
	if session[:semester_id] != nil && session[:semester_id] != ""
        	@faculties = Faculty.order(faculty_name: :desc)
		@all_faculty = {}
		faculty_courses = FacultyCourse.includes(:faculty,:course1,:course2,:course3) 
        	faculty_courses.each do |faculty_course|
        		faculty = faculty_course.faculty
			course1 = faculty_course.course1
			course2 = faculty_course.course2
			course3 = faculty_course.course3
			course1_name = ""
			course2_name = ""
			course3_name = ""
			if course1 != nil
				course1_name = course1.course_name + " " + course1.CourseTitle
			end
			if course2 != nil
				course2_name = course2.course_name + " " + course2.CourseTitle
			end
			if course3 != nil
				course3_name = course3.course_name + " " + course3.CourseTitle
			end
			@all_faculty[faculty.id] = {:faculty_name => faculty.faculty_name, :course1 => course1_name, :course2 => course2_name, :course3 => course3_name}
		end
	else 
		flash[:error] = "Please choose semester"
		redirect_to root_path
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
	@faculty_course = FacultyCourse.includes(:faculty).find(params[:id])
	@faculty = @faculty_course.faculty
	@courses = Course.all()
    end

    def edit
    	faculty_course = FacultyCourse.find(params[:id])
	faculty_course.update_attributes!(params[:courses].permit(:course1_id,:course2_id,:course3_id))
	flash[:notice] = "Courses information updated successfully"
	redirect_to faculty_courses_path
    end
end
