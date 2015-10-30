require 'rails_helper'

describe FacultyCoursesController do
    describe 'showing list of faculty and courses' do
	it 'should call the model method to get the list of faculties' do
 		@fake_faculty = [double('1'), double('2')]
		@fake_courses = [double('1'),double('2')]
  		Faculty.should_receive(:order).and_return(@fake_faculty)
		post :index
	end
        it 'should make the faculties available to the index template for rendering' do
		Faculty.stub(:order).and_return(@fake_faculty)
		post :index
		assigns(:faculties).should == @fake_faculty
		response.should render_template :index
	end
	it 'should display courses assigned to faculties' do
		faculty_courses = [double(:faculty_id => '1',:course1_id => '1',:course2_id => '2',:course3_id => '3'),double(:faculty_id => '2',:course1_id => '4',:course2_id => '5',:course3_id => '6')]
		FacultyCourse.should_receive(:all).and_return(faculty_courses)
		course1 = Course.new
		course1.course_name = 'course1'
		course2 = Course.new
		course2.course_name = 'course2'
		courses = [course1,course2]
		Course.stub(:where).and_return(courses)
		Faculty.stub(:find).and_return(double(:id => '1',:faculty_name => 'test'))
		post :index
	end
   end
   describe 'showing the selected faculty and courses' do
	before :each do
		@faculty_course = double('1')
		@faculty_course.stub(:faculty_id).and_return("1")
	end 
	it 'should call the model method to get the selected faculty-course object' do
		FacultyCourse.should_receive(:find_by_faculty_id).and_return(@faculty_course)
		post :select_faculty, {:faculty_id => "1 "}
 	end
	it 'should redirect to the show template for rendering' do
		FacultyCourse.stub(:find_by_faculty_id).and_return(@faculty_course)
		post :select_faculty, {:faculty_id => "1"}
		response.should redirect_to(faculty_course_path(@faculty_course))
	end
	it 'should call model method for creating faculty-course object if selected faculty not found' do
		FacultyCourse.stub(:find_by_faculty_id).and_return(nil)
		FacultyCourse.should_receive(:create!).and_return(@faculty_course)
		post :select_faculty, {:faculty_id => "1"}		
	end
	it 'should redirect to index page if faculty_id is blank' do
		post :select_faculty, {:faculty_id => ""}
		response.should redirect_to faculty_courses_path
	end
	it 'should make the faculty details available to the show template' do
		FacultyCourse.stub(:find).and_return(@faculty_course)
		faculty = double('1')
		Faculty.stub(:find).and_return(faculty)
		courses = [double('1'),double('2')]
		Course.stub(:all).and_return(courses)
		post :show, {:id => "1"}
		assigns(:faculty_course).should == @faculty_course
		assigns(:faculty).should == faculty
		assigns(:courses).should == courses
	end
   end
   describe 'updating the courses for faculty' do
	it 'should call the model method to update the courses for the selected faculty' do
		faculty_course = FacultyCourse.new
		FacultyCourse.stub(:find).and_return(faculty_course)
		params = {:id => 1,:courses => {:course1_id => "",:coure2_id => "",:course3_id => ""}}
		faculty_course.should_receive(:update_attributes!)
		post :edit, params
	end
   end
end
