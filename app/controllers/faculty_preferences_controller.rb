class FacultyPreferencesController < ApplicationController
  def index
    @faculty_courses = FacultyCourse.order(:id)
    respond_to do |format|
      format.html
      format.csv {render text: @faculty_courses.to_csv}
    end
  end

  def new
    #@faculty_course = FacultyCourse.find(params[:faculty_course_id])

    @faculty_preference = FacultyPreference.new(faculty_course: @faculty_course) 
    @faculty_preference.build_preference1
    @faculty_preference.build_preference2
    @faculty_preference.build_preference3
  	@building_options = Building.all
    @time_slot_options = TimeSlot.all
    @classroomTiming = ClassroomTiming.where(:semester_id => session[:semester_id]).all
    @day_options = DayCombination.all
    @faculty_courses = FacultyCourse.all
  end

  def create
    @faculty_preference = FacultyPreference.new(faculty_preference_params)
    if @faculty_preference.save
      redirect_to @faculty_preference
    else
      render :new  
    end
  end
  
  def show 
    @faculty_preference = FacultyPreference.find(params[:id])
    @faculty_course = FacultyCourse.find(@faculty_preference.faculty_course_id)
    @faculty = Faculty.find(@faculty_course.faculty_id)
  end 

  

  private
  def faculty_preference_params 
    params.require(:faculty_preference).permit(:faculty_course_id, :semester_id, preference1_attributes: preference_params, preference2_attributes: preference_params, preference3_attributes: preference_params)
  end

  def preference_params
    [:day_combination_id, :building_id, :time_slot_id]
  end
end