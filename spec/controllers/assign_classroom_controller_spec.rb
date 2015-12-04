require 'rails_helper'
require 'spec_helper'

describe ClassController,  :type => :controller do 
   describe 'create,destroy,update,edit and show' do
    it 'should create a ClassroomTiming' do
    	m = double(ClassroomTiming, :room_id => "1", :time_slot_id => "10:20 am to 11:10 am", :day_combination_id => "MWF")
    	#ClassroomTiming.stub(:create).with(hash_including(:room_id => "1",:time_slot_id => :to_s , :day_combination_id => :to_s)){m}
      	ClassroomTiming.stub(:create).and_return(m)
      	post :create, {:class => {:room_id => "1",:time_slot_id => :to_s , :day_combination_id => :to_s}}    
      	response.should redirect_to(class_index_path)
    end
    it 'should destroy a ClassroomTiming' do
     	m = double(ClassroomTiming, :room_id => "1", :time_slot_id => "10:20 am to 11:10 am", :day_combination_id => "MWF")
     	ClassroomTiming.stub(:find).with("1").and_return(m)
      	m.should_receive(:destroy)
      	delete :destroy, {:id => "1"}
      	response.should redirect_to(class_index_path)
    end
    it 'should create a new Room' do
    	m = double(Building, :building_name => "HRBB",:id => "1")
    	n = double(Room, :room_name => "124",:building_id => "1",:Capacity => "88")
    	Building.stub(:find_or_create_by).and_return(m)
    	Room.stub(:find_or_create_by).and_return(n)
    	post :new, {:class => {:building_name => "HRBB",:room_name => :to_s ,:building_id => m.id, :Capacity => :to_s}}
    	response.should redirect_to(class_index_path)
    end
    it 'should redirect to home page if semester is not set' do
	post :index
	response.should redirect_to root_path
    end
    it 'should show a ClassroomTiming' do
    	session[:semester_id] = '1'
    	m = double(Room, :room_name => "124",:building_id => "1",:Capacity => "88")
    	classroomtimings = [double(:id => '1',:room_id => "1", :time_slot_id => "10:20 am to 11:10 am", :day_combination_id => "MWF")]
    	ClassroomTiming.should_receive(:where).and_return(classroomtimings) 
    	Building.stub_chain(:first,:id)
    	Room.should_receive(:where).and_return([m])
    	Room.stub(:find).and_return(m)
    	post :index
    end
    it 'should call a updateRoom' do
    	m = double(Room, :room_name => "124",:building_id => "1",:Capacity => "88")
    	#Building.stub_chain(:first,:id)
    	Room.stub(:where).and_return(m)
    	get :update_room ,format: :js
    end
    it 'should call a updateCapacity' do
    	m = double(Room, :room_name => "124",:building_id => "1",:Capacity => "88")
    	#Building.stub_chain(:first,:id)
    	Room.stub(:find_by_id).and_return(m)
    	get :update_capacity, format: :js
    end
    it 'should call model method to get the corresponding timeslots' do
	TimeSlot.should_receive(:where).with("day_combination_id = ?","1").and_return([])
	post :update_timeslot, {:day_combination_id => '1', :format => :js}
	assigns(:timeslots).should == []
    end
  end
end
