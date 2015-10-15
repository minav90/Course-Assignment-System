require 'rails_helper'

describe FacultyCoursesController do
    describe 'showing list of faculty and courses' do
	it 'should call the model method to get the list of faculties' do
 		@fake_faculty = [double('1'), double('2')]
		@fake_courses = [double('1'),double('2')]
  		Faculty.should_receive(:all).with(no_args).and_return(@fake_faculty)
		post :index
	end
        it 'make the faculties available to the index template for rendering' do
		Faculty.stub(:all).and_return(@fake_faculty)
		post :index
		assigns(:faculties).should == @fake_faculty
		response.should render_template :index
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
end
