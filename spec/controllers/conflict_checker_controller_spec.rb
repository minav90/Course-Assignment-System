require 'rails_helper'

describe ConflictCheckerController do
    before :each do
		@day_combinations = [double(:id => 1,:day_combination => 'test')]
		@time_slots = [double(:id => 1,:time_slot => 'test')]
		@time_ranges = [double(:t_range => 'Morning',:t_slots => '1',:day_combination_id => 1)]
		@buildings = [double(:id => 1,:building_name => 'test')]
		session[:semester_id] = '1'
    end
    describe 'getting conflict data' do
	it 'should call the appropriate model methods to get conflict data' do
		DayCombination.should_receive(:all).and_return(@day_combinations)
		Building.should_receive(:all).and_return(@buildings)
		post :index
	end
	it 'should get the values from session if present' do
		DayCombination.stub(:all).and_return(@day_combinations)
                Building.stub(:all).and_return(@buildings)
		session[:conflicts] = []
		session[:dayComboId] = []
		session[:timeSlotId] = []
		session[:buildingId] = []
		session[:computed] = true
		post :index
	end
    end
    describe 'creating conflict data' do
	it 'should call the appropriate model methods to create the conflict data' do
		DayCombination.stub(:all).and_return(@day_combinations)
		TimeRange.should_receive(:all).and_return(@time_ranges)
		Building.stub(:all).and_return(@buildings)
		TimeSlot.stub(:all).and_return(@time_slots)
		faculty_preferences = [double(:id => 1,:faculty_course_id => '1',:semester_id => '1',:preference1_id => '1',:preference2_id => '2',:preference3_id => '3')]
		preferences = [double(:id => 1,:note => 'test',:building_id => 1,:day_combination_id => 1,:time_slot_id => 1,:semester_id => '1')]
		FacultyPreference.should_receive(:where).and_return(faculty_preferences)
		Preference.stub(:find_by).and_return(preferences[0])
		faculty_courses = [double(:faculty_id => '1',:course1_id => 1,:course2_id => nil,:course3_id => nil,:id => 1)]
		FacultyCourse.stub(:where).and_return(faculty_courses)
		courses = [double(:course_name => '229',:CourseTitle => 'test1',:id => 1)]
		Course.stub(:all).and_return(courses)
		faculties = [double(:id => 1,:faculty_name => 'test1')]
		Faculty.stub(:all).and_return(faculties)
		course_assignments = [double(:id => 1, :course_id => 1,:faculty_id => 1,:room_id => 1,:day_combination_id => 1,:time_slot_id => 1)]
		CourseAssignment.stub(:count).and_return(1)
		CourseAssignment.stub(:where).and_return(course_assignments)
		post :create, {:conflict_checker => {:day_combinations_id => 1, :time_ranges => 'Morning',:buildings_id => 1}}
	end
    end
end
