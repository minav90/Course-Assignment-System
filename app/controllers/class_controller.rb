class ClassController < ApplicationController
	def show

  end

  #Method functions:
  #1) check whether semester is set or not
  #2) creates @showClassroomDetails hashmap containing details like building,timeslot,day combo
  #and sent to Assign Classroom page
  def index
    if session[:semester_id] != nil && session[:semester_id] != ""
      @building = Building.all
      @timeslot = TimeSlot.all
      @classroomTiming = ClassroomTiming.where("semester_id = ?",session[:semester_id])
      @day_combination = DayCombination.all
      @room = Room.where("building_id = ?",Building.first.id)
      @showClassroomDetails = Hash.new
      @classroomTiming.each do |classes| 
       @tempRoom = Room.find(classes.room_id)
       @showClassroomDetails[classes.id] = {:room => @tempRoom ,
         :timeslot => TimeSlot.find_by_id(classes.time_slot_id),
         :building => Building.find_by_id(@tempRoom.building_id),
         :day_combination => DayCombination.find_by_id(classes.day_combination_id)}
       end
     else
      flash[:error] = "Please choose semester"
      redirect_to root_path
    end
  end

#Method functions:
#1)Used (during AJAX call)to update room numbers based on building selected 
def update_room
  @rooms = Room.where("building_id = ?", params[:building_id])
  respond_to do |format|
    format.js
  end
end

#Method functions:
#1)Used (during AJAX call)to update timeslots based on daycombo selected 
def update_timeslot
  @timeslots = TimeSlot.where("day_combination_id = ?", params[:day_combination_id])
  respond_to do |format|
    format.js
  end
end

#Method functions:
#1)Used (during AJAX call)to update Capacity of room based on room selected 
def update_capacity
  @capacity = Room.find_by_id(params[:room_id])
  respond_to do |format|
    format.js
  end
end

#Method functions:
#1)Used to assign new classroom for a particular semester
#2)Flashes Error is class was Already assigned
def create
 if ClassroomTiming.exists?(:semester_id => session[:semester_id], :room_id => params[:class][:rooms_id], :time_slot_id => params[:class][:timeslots_id], :day_combination_id => params[:class][:day_combinations_id])
  flash[:error] = "Class Already Assigned"
else
  ClassroomTiming.create(semester_id: session[:semester_id], room_id: params[:class][:rooms_id], time_slot_id: params[:class][:timeslots_id], day_combination_id: params[:class][:day_combinations_id])
  flash[:success] = "Successfully Assigned Class"
end   
redirect_to class_index_path;
end

#Method functions:
#1)Used to delete class assigned  
def destroy
  @classes = ClassroomTiming.find(params[:id])
  @classes.destroy
  flash[:success] = "Deleted class Successfully" 
  redirect_to class_index_path
end

#Method functions:
#1)Used to create new class and add building and room details to static tables
def new
 if params[:class][:building_name] == "" || params[:class][:room_name] == "" || params[:class][:room_capacity] == "" 
     flash[:error] = "Fill All Details Before Submitting"
 else
 @building = Building.find_or_create_by!(:building_name=>params[:class][:building_name])
 @room = Room.find_or_create_by!(:room_name=>params[:class][:room_name],:building_id=>@building.id)
 @room.Capacity =  params[:class][:room_capacity]
 @room.save
 flash[:success] = "Successfully Created/Updated Class"
 end
 redirect_to class_index_path
end

end
