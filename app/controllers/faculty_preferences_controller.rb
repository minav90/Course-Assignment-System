class FacultyPreferencesController < ApplicationController
  layout "faculty_preference"
  def index
    @facultycourse = FacultyCourse.joins("LEFT JOIN faculties ON faculties.id = faculty_id").where(:semester_id => session[:semester_id]).all.order("faculty_name")
    @faccourses  = Hash.new
    @facultycourse.each do |faccourse|
      @faccourses[faccourse.id] = {:faculty_name => Faculty.find(faccourse.faculty_id).faculty_name}
    end
  end

  def new
    @faculty_course = FacultyCourse.find(params[:faculty_course_id])

    @faculty_preference = FacultyPreference.new(faculty_course: @faculty_course) 
    @faculty_preference.build_preference1
    @faculty_preference.build_preference2
    @faculty_preference.build_preference3
  	@building_options = Building.all
    @time_slot_options = TimeSlot.all
    @classroomTiming = ClassroomTiming.where(:semester_id => session[:semester_id]).all
    @day_options = DayCombination.all
    @faculty_courses = FacultyCourse.all
    @faculty_course = FacultyCourse.find(params[:faculty_course_id])
    @faculty = Faculty.find(@faculty_course.faculty_id)
  end

  def create
    

    @faculty_preference = FacultyPreference.find_by_faculty_course_id(params[:faculty_preference][:faculty_course_id])
    #@faculty_preference = FacultyPreference.where(find: 'find_value').first_or_create.update(update: 'update_value')
    #permitted[:faculty_preference][:preference2_attributes][:note] => params[:faculty_preference][:preference1_attributes][:note]
    if(@faculty_preference.nil?)
      @faculty_preference = FacultyPreference.new(faculty_preference_params)
      @faculty_preference.semester_id = session[:semester_id]

    else
      @faculty_preference.update_attributes(faculty_preference_params)
    end
      if @faculty_preference.save
        redirect_to display_summary_path(@faculty_preference)
      else
        render :new
      end
  end
  
  def display_summary 
    
  end  

  def update_time_slots
    # updates artists and songs based on genre selected
    #day_combination_1 = DayCombination.find(params[:faculty_preference][:preference1_attributes][:day_combination_id])
    #day_combination_2 = DayCombination.find(params[:faculty_preference][:preference2_attributes][:day_combination_id])
    #day_combination_3 = DayCombination.find(params[:faculty_preference][:preference3_attributes][:day_combination_id])
    # map to name and id for use in our options_for_select
    
    #For first preference
    time_slots = TimeSlot.where("day_combination_id = ?",params[:day_combination_id] )
    @time_slot_options = {}
    @time_slot_options["data"] = {}
    time_slots.each {|time_slot|
	puts(time_slot.time_slot)
	@time_slot_options["data"][time_slot.id.to_s] = time_slot.time_slot
    }
    respond_to do |format|
                format.json {render json: @time_slot_options}
        end
  end

  private
  def faculty_preference_params 
    params[:faculty_preference][:preference1_attributes][:note] = params[:faculty_preference][:preference3_attributes][:note]
    params[:faculty_preference][:preference2_attributes][:note] = params[:faculty_preference][:preference3_attributes][:note]
    params.require(:faculty_preference).permit(:faculty_course_id, :semester_id, preference1_attributes: preference_params, preference2_attributes: preference_params, preference3_attributes: preference_params)
  end

  def preference_params
    [:day_combination_id, :building_id, :time_slot_id, :note, :semester_id]
  end
end
