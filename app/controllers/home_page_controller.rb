class HomePageController < ApplicationController
  def home
  	@semester = Semester.all
  end

  def addfaculty
	if params[:class] != nil && params[:class][:FacultyName] != ""
  		Faculty.create!(faculty_name: params[:class][:FacultyName])
	end
     #redirect_to root_path;
  end

  def addcourse
	if params[:class] != nil && params[:class][:CourseName] != ""
  		Course.create!(:course_name => params[:class][:CourseName], :CourseTitle => params[:class][:CourseTitle])
	end
     #redirect_to root_path;
  end

  def addsemester
  end

  def setsession
  	session[:semester_id] = params[:class][:semester_id]
  	redirect_to root_path;
  end

  def createsemester
    success = false;
    if params[:class] != nil && params[:class][:SemesterTitle] != ""
  	semester = Semester.find_by(SemesterTitle: params[:class][:SemesterTitle])
	if semester == nil
		Semester.create_semester(params[:class][:SemesterTitle])
		success = true
	end
    end
    if success == true
	flash[:success] = "Created new semester"
	redirect_to root_path;
    else
	flash[:error] = "Enter a valid and new semester"
	redirect_to addsemester_path;
    end
  end

end
