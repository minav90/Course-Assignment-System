class ClassController < ApplicationController
	def show

  end

  def index
    @building = Building.all
    @timeslot = TimeSlot.all
    @classroomTiming = ClassroomTiming.where(:semester_id => session[:semester_id]).all
    @day_combination = DayCombination.all
    @room = Room.where("building_id = ?",Building.first.id)
    @showClassroomDetails = Hash.new
    @classroomTiming.each do |classes| 
     @tempRoom = Room.find_by_id(classes.room_id)
     @showClassroomDetails[classes.id] = {:room => @tempRoom ,
       :timeslot => TimeSlot.find_by_id(classes.time_slot_id),
       :building => Building.find_by_id(@tempRoom.building_id),
       :day_combination => DayCombination.find_by_id(classes.day_combination_id)}
     end
   end
   
   def update_room
    @rooms = Room.where("building_id = ?", params[:building_id])
    respond_to do |format|
      format.js
    end
  end

   def update_capacity
    @capacity = Room.find_by_id(params[:room_id])
    respond_to do |format|
      format.js
    end
  end

  def create
      ClassroomTiming.create(semester_id: session[:semester_id], room_id: params[:class][:rooms_id], time_slot_id: params[:class][:timeslots_id], day_combination_id: params[:class][:day_combinations_id])
      redirect_to class_index_path;
  end
    
  def destroy
    @classes = ClassroomTiming.find(params[:id])
    @classes.destroy
    redirect_to class_index_path
  end

  def new
     @building = Building.find_or_create_by!(:building_name=>params[:class][:building_name])
     @room = Room.find_or_create_by!(:room_name=>params[:class][:room_name],:building_id=>@building.id,:Capacity => params[:class][:room_capacity])
     redirect_to class_index_path
  end

end
