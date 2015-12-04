require 'rails_helper'

describe ConflictCheckerController do
	before :each do
		@day_combinations = [double(:id => '1',:day_combination => 'test')]
		@time_slots = [double(:id => '1',:time_slot => 'test')]
		@buildings = [double(:id => '1',:building_name => 'test')]
	end
	describe 'getting conflict data' do
		before :each do
			session[:semester_id] = '1'
		end
		it 'should call the appropriate model methods to get conflict data' do
			DayCombination.should_receive(:all).and_return(@day_combinations)
			TimeSlot.should_receive(:all).and_return(@time_slots)
			Building.should_receive(:all).and_return(@buildings)
			post :index
		end
		it 'should get the values from session if present' do
			DayCombination.stub(:all).and_return(@day_combinations)
                        TimeSlot.stub(:all).and_return(@time_slots)
                        Building.stub(:all).and_return(@buildings)
			session[:conflicts] = []
			session[:dayComboId] = []
			session[:timeSlotId] = []
			session[:buildingId] = []
			session[:computed] = true
			post :index
		end
	end
end
