class HomePageController < ApplicationController
  def home
  	@semester = Semester.all
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
end
