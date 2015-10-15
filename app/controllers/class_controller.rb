class ClassController < ApplicationController
	def show

  end

  def index
    @building = Building.all
    @timeslot = TimeSlot.all
    @room = Room.where("building_id = ?",Building.first.id)
  end
  
  def update_room
    @rooms = Room.where("building_id = ?", params[:building_id])
    respond_to do |format|
      format.js
    end
  end

  def create
      ClassroomTiming.create(room_id: params[:class][:rooms_id], time_slot_id: params[:class][:timeslots_id])
      redirect_to class_index_path;
  end
    
  def destroy
    @classes = ClassroomTiming.find(params[:id])
    @classes.destroy
    redirect_to class_index_path
  end

  def new
     @building = Building.find_or_create_by!(:building_name=>params[:class][:building_name])
     @room = Room.find_or_create_by!(:room_name=>params[:class][:room_name],:building_id=>@building.id)
     redirect_to class_index_path
  end

end
