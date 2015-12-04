require 'rails_helper'

RSpec.describe HomePageController, type: :controller do
  # 0. HOME link at the top
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "add new faculty" do
    it "should call the model method to create new faculty" do
	Faculty.should_receive(:create!).with({:faculty_name => "Faculty1"})
	post :addfaculty, {:class => {:FacultyName => "Faculty1"}}
    end
  end

  describe "add new course" do
    it "should call the model method to create new course" do
	Course.should_receive(:create!).with({:course_name => "name",:CourseTitle => "title"})
	post :addcourse, {:class => {:CourseName => "name",:CourseTitle => "title"}}
    end
  end

  describe 'setting semester id in session' do
	it 'should set the semester id in session and redirect to home page' do
		post :setsession, {:class => {:semester_id => '1'}}
		session[:semester_id].should == '1'
		response.should redirect_to root_path
	end
  end

  describe 'creating new semester' do
	it 'should call model method to create new semester' do
		Semester.should_receive(:find_by)
		Semester.should_receive(:create_semester).with('test1')
		post :createsemester, {:class => {:SemesterTitle => 'test1'}}
	end
	it 'should check for valid input before creating new semester' do
		post :createsemester, {:class => {:SemesterTitle => ''}}
		response.should redirect_to addsemester_path
	end
  end

  # Links to various pages:

=begin
  # 1. Add Courses and Faculty
  describe "GET #course_and_faculty" do
    it "redirects to the Courses and Faculty page" do
      get :course_and_faculty
      expect(response).to have_http_status(:success)
    end
  end
=end

=begin  # 2. Add Classrooms and Timings
  describe "GET #addclassroom" do
    it "returns http success" do
      get :addclassroom
      expect(response).to have_http_status(:success)
    end
  end
=end
=begin
  # 3. Show Courses assigned
  describe "GET #courses_assigned" do
    it "redirects to the Courses assigned page" do
      get :courses_assigned
      expect(response).to have_http_status(:success)
    end
  end
=end

=begin
  # 4. Show Faculty Preferences
  describe "GET #faculty_preferences" do
    it "redirects to the Faculty Preferences page" do
      get :facultyprefs
      expect(response).to have_http_status(:success)
    end
  end
=end

=begin
  # 5. Show Conflict Resolution
  describe "GET #conflict_resolution" do
    it "redirects to the Conflict Resolution page" do
      get :conflict_resolution
      expect(response).to have_http_status(:success)
    end
  end
=end

=begin
  # 6. Add New Faculty
  describe "GET #add_new_faculty" do
    it "redirects to the Add New Faculty page" do
      get :add_new_faculty
      expect(response).to have_http_status(:success)
    end
  end
=end

=begin
  # 7. Add New Course
  describe "GET #add_new_course" do
    it "redirects to the Add New Course page" do
      get :add_new_course
      expect(response).to have_http_status(:success)
    end
  end
=end

end

