require 'rails_helper'

describe CourseAssignmentsController do
    before :each do
	session[:semester_id] = '1'
    end
    describe 'showing faculties' do
	before :each do
		@fake_faculties = [Faculty.new]
		@fake_assignments = [double(:semester_id => '1',:faculty_id => '1',:course_id => '1',:room_id => '1',:day_combination_id => '1',:time_slot_id => '1',:course => double(:course_name => '',:CourseTitle => ''), :room => double(:room_name => '',:building_id => ''), :day_combination => double(:day_combination => ''),:time_slot => double(:time_slot => ''))]
		CourseAssignment.stub(:includes).and_return(CourseAssignment)
	end
	it 'should redirect to the home page if semester is not set' do
		session[:semester_id] = ''
		post :index
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
		building = double(:id => '1',:building_name => 'test')
		Building.should_receive(:find).and_return(building)
		post :index
	end
    end
    describe 'selecting faculty' do
	before :each do
		@faculty_course = [double(:course1 => double(:id => '1',:course_name => 'test',:CourseTitle => 'test'),:course2 => double(:id => '2',:course_name => 'test',:CourseTitle => 'test'),:course3 => double(:id => '3',:course_name => 'test',:CourseTitle => 'test'))]
		@course = double(:id => '1',:course_name => 'test')
		FacultyCourse.stub(:includes).and_return(FacultyCourse)
		CourseAssignment.stub(:includes).and_return(CourseAssignment)
	end
	it 'should call model method to get the faculty_courses' do
		FacultyCourse.should_receive(:where).and_return([])
		post :update_faculty_details, {:faculty_id => '1', :format => :js}
	end
	it 'should call model method to get the course_assignments' do
		FacultyCourse.stub(:where).and_return(@faculty_course)
		course_assignments = [double(:room_id => '1',:course_id => '1',:room => double(:building_id => '')),double(:room_id => '2',:course_id => '2',:room => double(:building_id => ''))]
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
	it 'should return empty data if building not selected' do
                ClassroomTiming.stub(:includes).and_return(ClassroomTiming)
		ClassroomTiming.stub(:where).and_return([])
		post :update_day_combination, {:room_id => '1', :course_id => '1',:format => :json}
	end
	it 'should get day combinations for the selected room' do
		ClassroomTiming.stub(:includes).and_return(ClassroomTiming)
		classroom_timings = [double(:day_combination_id => '1',:day_combination => double(:id => '',:day_combination => '')),double(:day_combination_id => '2',:day_combination => double(:id => '',:day_combination => ''))]
		course_assignments = [double(:day_combination_id => '1',:course_id => '1'),double(:day_combination_id => '2',:course_id => '2'),double(:day_combination_id => '3',:course_id => '3')]
		ClassroomTiming.should_receive(:where).with("room_id = ?","1").and_return(classroom_timings)
		CourseAssignment.should_receive(:where).with("semester_id = ? and course_id = ?","1",'1').and_return(course_assignments)
		post :update_day_combination, {:room_id => '1', :course_id => '1',:format => :json}
	end
    end
    describe 'selecting day combination' do
	it 'should get time slots for the selected day combination ' do
		ClassroomTiming.stub(:includes).and_return(ClassroomTiming)
		classroom_timings = [double(:time_slot_id => '1',:time_slot => double(:id => '',:time_slot => '')),double(:time_slot_id => '2',:time_slot => double(:id => '',:time_slot => ''))]
		course_assignments = [double(:time_slot_id => '1',:course_id => '1'),double(:time_slot_id => '2',:course_id => '2'),double(:time_slot_id => '3',:course_id => '3')]
		ClassroomTiming.should_receive(:where).with("room_id = ? and day_combination_id = ?","1","1").and_return(classroom_timings)
		CourseAssignment.should_receive(:where).with("semester_id = ? and course_id = ?","1",'1').and_return(course_assignments)
		post :update_time_slot, {:room_id => '1',:day_combination_id => '1', :course_id => '1', :format => :json}
	end
    end
    
    describe 'assigning classroom and timings' do
	before :each do
		CourseAssignment.stub(:includes).and_return(CourseAssignment)
		@course_assignments = [double(:id => '1',:faculty_id => '1',:course_id => '1',:faculty => double(:id => '1',:faculty_name => 'test'),:course => double(:id => '1',:course_name => 'test'))]
	end
	it 'should create a new assignment if none exists' do
		CourseAssignment.stub(:where).and_return([])
		course_assignment = double(:faculty_id => '1',:course_id => '1',:faculty => double(:id => '1',:faculty_name => 'test'),:course => double(:id => '1',:course_name => 'test'))
		CourseAssignment.should_receive(:create!).and_return(course_assignment)
		post :update_course_assignment, {:faculty_id => '1', :course_id => '1',:format => 'js',:building_select_1 => "1"}
	end
	it 'should update the class room and timing details for faculty course' do
		CourseAssignment.stub(:where).and_return(@course_assignments)
		@course_assignments[0].should_receive(:update_attributes!)
		post :update_course_assignment, {:faculty_id => '1',:room_id => '1',:day_combination_id => '1', :course_id => '1',:time_slot_id  => '1', :format => :js}
	end
	it 'should delete existing assignment if building id is blank' do
		CourseAssignment.stub(:where).and_return(@course_assignments)
		CourseAssignment.should_receive(:destroy)
		post :update_course_assignment, {:faculty_id => '1', :course_id => '1',:format => 'js',:building_select_1 => ""}
	end
    end
  end
