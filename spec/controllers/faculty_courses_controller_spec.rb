require 'rails_helper'

describe FacultyCoursesController do
    describe 'showing list of faculty and courses' do
	before :each do
		@fake_faculty = [double('1'), double('2')]
                @fake_courses = [double('1'),double('2')]
		FacultyCourse.stub(:includes).and_return(FacultyCourse)
	end
	it 'should redirect to home page if semester not set' do
		post :index
		response.should redirect_to root_path
	end
        it 'should get all faculties and display courses assigned to faculties' do
		session[:semester_id] = '1'
                Faculty.should_receive(:order).and_return(@fake_faculty)
		faculty_courses = [double(:faculty_id => '1',:course1_id => '1',:course2_id => '2',:course3_id => '3',:faculty => double(:id => '',:faculty_name => ''),:course1 => double(:id => '',:course_name => '',:CourseTitle => ''),:course2 => double(:id => '',:course_name => '',:CourseTitle => ''),:course3 => double(:id => '',:course_name => '',:CourseTitle => ''))]
		FacultyCourse.should_receive(:where).with("semester_id = ?","1").and_return(faculty_courses)
		post :index
		assigns(:faculties).should == @fake_faculty
                response.should render_template :index
	end
	it 'should delete record if none of the courses are assigned' do
		session[:semester_id] = '1'
		Faculty.stub(:order).and_return(@fake_faculty)
		faculty_courses = [double(:id => '1',:faculty_id => '1',:course1_id => nil,:course2_id => nil,:course3_id => nil,:faculty => double(:id => '',:faculty_name => ''),:course1 => nil,:course2 => nil,:course3 => nil)]
		FacultyCourse.stub(:where).and_return(faculty_courses)
		FacultyCourse.should_receive(:destroy)
		post :index
	end
   end
   describe 'showing the selected faculty and courses' do
	before :each do
		@faculty_course = double('1',:faculty => double(:id => '',))
		@faculty_course.stub(:faculty_id).and_return("1")
	end 
	it 'should call the model method to get the selected faculty-course object' do
		FacultyCourse.should_receive(:where).and_return([@faculty_course])
		post :select_faculty, {:faculty_id => "1 "}
 	end
	it 'should redirect to the show template for rendering' do
		FacultyCourse.stub(:where).and_return([@faculty_course])
		post :select_faculty, {:faculty_id => "1"}
		response.should redirect_to(faculty_course_path(@faculty_course))
	end
	it 'should call model method for creating faculty-course object if selected faculty not found' do
		FacultyCourse.stub(:where).and_return([])
		FacultyCourse.should_receive(:create!).and_return(@faculty_course)
		post :select_faculty, {:faculty_id => "1"}		
	end
	it 'should redirect to index page if faculty_id is blank' do
		post :select_faculty, {:faculty_id => ""}
		response.should redirect_to faculty_courses_path
	end
	it 'should make the faculty details available to the show template' do
		FacultyCourse.stub(:includes).and_return(FacultyCourse)
		FacultyCourse.stub(:find).and_return(@faculty_course)
		courses = [double('1'),double('2')]
		Course.stub(:all).and_return(courses)
		post :show, {:id => "1"}
		assigns(:faculty_course).should == @faculty_course
		assigns(:faculty).should == @faculty_course.faculty
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
