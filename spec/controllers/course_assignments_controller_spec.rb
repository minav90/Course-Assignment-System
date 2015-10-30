require 'rails_helper'

describe CourseAssignmentsController do
    describe 'showing faculties' do
	it 'should call the model method to get all faculties' do
		Faculty.should_receive(:order)
		post :index
	end
	it 'should make the faculties available to the index template for rendering' do
		fake_faculties = [Faculty.new,Faculty.new]
		Faculty.stub(:all).and_return(fake_faculties)
		Faculty.stub(:order).and_return(fake_faculties)
		post :index
		assigns(:faculties).should == fake_faculties
		response.should render_template(:index)
	end
    end
    describe 'selecting faculty' do
	before :each do
		@faculty_course = double(:course1_id => '1',:course2_id => '2',:course3_id => '3')
		@course = double(:id => '1',:course_name => 'test')
		Course.stub(:find).and_return(@course)
		@room = double(:building_id => '1')
		Room.stub(:find).and_return(@room)
	end
	it 'should call model method to get the faculty_courses' do
		FacultyCourse.should_receive(:find_by_faculty_id).and_return(@faculty_course)
		post :update_faculty_details, {:faculty_id => '1', :format => :js}
	end
	it 'should call model method to get the course_assignments' do
		FacultyCourse.stub(:find_by_faculty_id).and_return(@faculty_course)
		course_assignments = [double(:room_id => '1',:course_id => '1'),double(:room_id => '2',:course_id => '2'),double(:room_id => '3',:course_id => '3')]
		CourseAssignment.should_receive(:where).with("faculty_id = ?",'1').and_return(course_assignments)
		post :update_faculty_details, {:faculty_id => '1', :format => :js}
	end
    end
    describe 'selecting building' do
	it 'should call the model method to get rooms for the selected building' do
		rooms = [double(:id => 1,:room_name => 'room1'),double(:id => '1',:room_name => 'room2')]
		Room.should_receive(:where).with("building_id = ?",'1').and_return(rooms)
		course_assignments = [double(:room_id => '1',:course_id => '1'),double(:room_id => '2',:course_id => '2'),double(:room_id => '3',:course_id => '3')]
		CourseAssignment.should_receive(:where).with("course_id = ?",'1').and_return(course_assignments)
		post :update_room, {:building_id => '1',:course_id => '1', :format => :json}
	end
    end
end
