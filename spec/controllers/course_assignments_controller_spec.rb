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
	it 'should get rooms for the selected building' do
		rooms = [double(:id => 1,:room_name => 'room1'),double(:id => '1',:room_name => 'room2')]
		Room.should_receive(:where).with("building_id = ?",'1').and_return(rooms)
		course_assignments = [double(:room_id => '1',:course_id => '1'),double(:room_id => '2',:course_id => '2'),double(:room_id => '3',:course_id => '3')]
		CourseAssignment.should_receive(:where).with("course_id = ?",'1').and_return(course_assignments)
		post :update_room, {:building_id => '1',:course_id => '1', :format => :json}
	end
    end
    describe 'selecting room' do
	it 'should get day combinations for the selected room' do
		classroom_timings = [double(:day_combination_id => '1'),double(:day_combination_id => '2')]
		course_assignments = [double(:day_combination_id => '1',:course_id => '1'),double(:day_combination_id => '2',:course_id => '2'),double(:day_combination_id => '3',:course_id => '3')]
		ClassroomTiming.should_receive(:where).with("room_id = ?","1").and_return(classroom_timings)
		day_combination = double(:id => '1',:day_combination => "MW")
		DayCombination.stub(:find).and_return(day_combination)
		CourseAssignment.should_receive(:where).with("course_id = ?","1").and_return(course_assignments)
		post :update_day_combination, {:room_id => '1', :course_id => '1',:format => :json}
	end
    end
    describe 'selecting day combination' do
	it 'should get time slots for the selected day combination ' do
		classroom_timings = [double(:time_slot_id => '1'),double(:time_slot_id => '2')]
		course_assignments = [double(:time_slot_id => '1',:course_id => '1'),double(:time_slot_id => '2',:course_id => '2'),double(:time_slot_id => '3',:course_id => '3')]
		time_slot = double(:id => '1', :time_slot => 'test')
		TimeSlot.stub(:find).and_return(time_slot)
		ClassroomTiming.should_receive(:where).with("day_combination_id = ?","1").and_return(classroom_timings)
		CourseAssignment.should_receive(:where).with("course_id = ?","1").and_return(course_assignments)
		post :update_time_slot, {:day_combination_id => '1', :course_id => '1', :format => :json}
	end
    end
    describe 'assigning classroom and timings' do
	it 'should update the class room and timing details for faculty course' do
		course_assignments = [double(:faculty_id => '1',:course_id => '1'),double(:faculty_id => '2',:course_id => '2'),double(:faculty_id => '3',:course_id => '3')]
		CourseAssignment.should_receive(:where).with("faculty_id = ? and course_id = ?",'1','1').and_return(course_assignments)
		course_assignments[0].should_receive(:update_attributes!)
		post :update_course_assignment, {:course_id => '1',:faculty_id => '1',:room_select_1 => '1',:day_combination_select_1 => '1',:time_slot_select_1 => '1',:format => :js}
	end
    end
end
