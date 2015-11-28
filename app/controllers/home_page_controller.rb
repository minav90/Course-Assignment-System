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
  	 Semester.create(SemesterTitle: params[:class][:SemesterTitle])
     redirect_to root_path;
  end

  def POST
      render :nothing => true  
  end

end
