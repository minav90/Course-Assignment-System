require 'rails_helper'

describe CourseAssignmentsController do
    before :each do
	session[:semester_id] = '1'
    end
    describe 'showing faculties' do
	before :each do
		@fake_faculties = [Faculty.new]
		@fake_assignments = [double(:semester_id => '1',:faculty_id => '1',:course_id => '1',:room_id => '1',:day_combination_id => '1',:time_slot_id => '1')]
	end
	it 'should call the model method to get all faculties' do
		Faculty.should_receive(:order).and_return(@fake_faculties)
		post :index
	end
	it 'should make the faculties available to the index template for rendering' do
		Faculty.stub(:order).and_return(@fake_faculties)
		post :index
		assigns(:faculties).should == @fake_faculties
		response.should render_template(:index)
	end
	it 'should call all models to get assignment details' do
		Faculty.stub(:order).and_return(@fake_faculties)
		CourseAssignment.should_receive(:where).and_return(@fake_assignments)
		course = double(:id => '1',:course_name => 'test')
		Course.should_receive(:find).and_return(course)
		room = double(:id => '1',:room_name => 'test',:building_id => '1')
		Room.should_receive(:find).and_return(room)
		building = double(:id => '1',:building_name => 'test')
		Building.should_receive(:find).and_return(building)
		day_combination = double(:id => '1',:day_combination => 'test')
		DayCombination.should_receive(:find).and_return(day_combination)
		time_slot = double(:id => '1',:time_slot => 'test')
		TimeSlot.should_receive(:find).and_return(time_slot)
		post :index
	end
    end
    describe 'selecting faculty' do
	before :each do
		@faculty_course = [double(:course1_id => '1',:course2_id => '2',:course3_id => '3')]
		@course = double(:id => '1',:course_name => 'test')
		Course.stub(:find).and_return(@course)
		@room = double(:building_id => '1')
		Room.stub(:find).and_return(@room)
	end
	it 'should call model method to get the faculty_courses' do
		FacultyCourse.should_receive(:where).and_return(@faculty_course)
		post :update_faculty_details, {:faculty_id => '1', :format => :js}
	end
	it 'should call model method to get the course_assignments' do
		FacultyCourse.stub(:where).and_return(@faculty_course)
		course_assignments = [double(:room_id => '1',:course_id => '1'),double(:room_id => '2',:course_id => '2'),double(:room_id => '3',:course_id => '3')]
		CourseAssignment.should_receive(:where).with("semester_id = ? and faculty_id = ?",'1','1').and_return(course_assignments)
		post :update_faculty_details, {:faculty_id => '1', :format => :js}
	end
    end
    describe 'selecting building' do
	it 'should get rooms for the selected building' do
		rooms = [double(:id => 1,:room_name => 'room1'),double(:id => '1',:room_name => 'room2')]
		Room.should_receive(:where).with("building_id = ?",'1').and_return(rooms)
		course_assignments = [double(:room_id => '1',:course_id => '1'),double(:room_id => '2',:course_id => '2'),double(:room_id => '3',:course_id => '3')]
		CourseAssignment.should_receive(:where).with("semester_id = ? and course_id = ?",'1','1').and_return(course_assignments)
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
		CourseAssignment.should_receive(:where).with("semester_id = ? and course_id = ?","1",'1').and_return(course_assignments)
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
		CourseAssignment.should_receive(:where).with("semester_id = ? and course_id = ?","1",'1').and_return(course_assignments)
		post :update_time_slot, {:day_combination_id => '1', :course_id => '1', :format => :json}
	end
    end
    
    describe 'assigning classroom and timings' do
	before :each do
		faculty = double(:id => '1',:faculty_name => 'test')
                Faculty.stub(:find).and_return(faculty)
                course = double(:id => '1',:course_name => 'test')
                Course.stub(:find).and_return(course)
	end
	it 'should create a new assignment if none exists' do
		CourseAssignment.stub(:where).and_return([])
		course_assignment = double(:faculty_id => '1',:course_id => '1')
		CourseAssignment.should_receive(:create!).and_return(course_assignment)
		course_assignment.should_receive(:update_attributes!)
		post :update_course_assignment, {:faculty_id => '1', :course_id => '1',:format => 'js',:building_select_1 => "1"}
	end
	it 'should update the class room and timing details for faculty course' do
		course_assignments = [double(:faculty_id => '1',:course_id => '1'),double(:faculty_id => '2',:course_id => '2'),double(:faculty_id => '3',:course_id => '3')]
		CourseAssignment.should_receive(:where).with("semester_id = ? and course_id = ?",'1','1').and_return(course_assignments)
		course_assignments[0].should_receive(:update_attributes!)
		post :update_course_assignment, {:faculty_id => '1',:room_id => '1',:day_combination_id => '1', :course_id => '1',:time_slot_id  => '1', :format => :js}
	end
	it 'should delete existing assignment if building id is blank' do
		CourseAssignment.stub(:where).and_return([double(:id => '1')])
		CourseAssignment.should_receive(:destroy)
		post :update_course_assignment, {:faculty_id => '1', :course_id => '1',:format => 'js',:building_select_1 => ""}
	end
    end
  end
