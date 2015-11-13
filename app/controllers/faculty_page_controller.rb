class FacultyPageController < ApplicationController
  def index
  end

  def create
  	
  end


  def new
  	@preference = Preference.new
  	@day_options		= DayCombination.all.map{|d| [ d.day_combination, d.id ] }
  	@building_options	= Building.all.map{|b| [ b.building_name, b.id ] }
  	@time_slot_options	= TimeSlot.all.map{|t| [ t.time_slot, t.id ] }
  	
  	
  end

  def show
  end
end
