class ClassController < ApplicationController
	def show

  end

  def index
    @building = Building.all
    @timeslot = TimeSlot.all
    @room = Room.where("Buildings_id = ?",Building.first.id)
  end
  
  def update_room
    @rooms = Room.where("Buildings_id = ?", params[:building_id])
    respond_to do |format|
      format.js
    end
  end

  def create
      ClassroomTiming.create(rooms_id: params[:class][:rooms_id], timeslots_id: params[:class][:timeslots_id])
      redirect_to class_index_path;
  end
    
  def destroy
    @classes = ClassroomTiming.find(params[:id])
    @classes.destroy
    redirect_to class_index_path
  end

  def new
     @building = Building.find_or_create_by!(:building_name=>params[:class][:building_name])
     @room = Room.find_or_create_by!(:room_name=>params[:class][:room_name],:Buildings_id=>@building.id)
     redirect_to class_index_path
  end

end
