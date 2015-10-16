require 'rails_helper'

RSpec.describe HomePageController, type: :controller do

  # 0. HOME link at the top
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  # Links to various pages:

  # 1. Add Courses and Faculty
  describe "GET #course_and_faculty" do
    it "redirects to the Courses and Faculty page" do
      get :course_and_faculty
      expect(response).to redirect_to("course_and_faculty_path")
    end
  end

  # 2. Add Classrooms and Timings
  describe "GET #addclassroom" do
    it "returns http success" do
      get :addclassroom
      expect(response).to have_http_status(:success)
    end
  end

  # 3. Show Courses assigned
  describe "GET #courses_assigned" do
    it "redirects to the Courses assigned page" do
      get :courses_assigned
      expect(response).to redirect_to("courses_assigned_path")
    end
  end

  # 4. Show Faculty Preferences
  describe "GET #faculty_preferences" do
    it "redirects to the Faculty Preferences page" do
      get :facultyprefs
      expect(response).to redirect_to("faculty_preferences_path")
    end
  end

  # 5. Show Conflict Resolution
  describe "GET #conflict_resolution" do
    it "redirects to the Conflict Resolution page" do
      get :conflict_resolution
      expect(response).to redirect_to("conflict_resolution_path")
    end
  end

  # 6. Add New Faculty
  describe "GET #add_new_faculty" do
    it "redirects to the Add New Faculty page" do
      get :add_new_faculty
      expect(response).to redirect_to("add_new_faculty_path")
    end
  end

  # 7. Add New Course
  describe "GET #add_new_course" do
    it "redirects to the Add New Course page" do
      get :add_new_course
      expect(response).to redirect_to("add_new_course_path")
    end
  end

end

