class PrefSummaryController < ApplicationController
	
#Method functions:
#1)Used to create @showPrefSummary Hashmap containing details like Faculty name,
#  courses,preferences and Faculty note
#2)Show preference details ordered by faculty name
def index
	if session[:semester_id] != nil && session[:semester_id] != ""
		@facultycourse = FacultyCourse.joins("LEFT JOIN faculties ON faculties.id = faculty_id").where(:semester_id => session[:semester_id]).all.order("faculty_name")

		@showPrefSummary = Hash.new

		@facultycourse.each do |facultycourse|
			course = Array.new
			course << Course.find_by_id(facultycourse.course1_id)
			course << Course.find_by_id(facultycourse.course2_id)
			course << Course.find_by_id(facultycourse.course3_id)
			prefids = Array.new
			prefids <<FacultyPreference.where(:faculty_course_id=> facultycourse.id).pluck(:preference1_id)[0]
			prefids <<FacultyPreference.where(:faculty_course_id => facultycourse.id).pluck(:preference2_id)[0]
			prefids <<FacultyPreference.where(:faculty_course_id => facultycourse.id).pluck(:preference3_id)[0]
			@note = Preference.where(:id => FacultyPreference.where(:faculty_course_id=> facultycourse.id).pluck(:preference1_id)[0]).pluck(:note)[0]
			if(@note.nil?)
				@note = "None! I just seem to like it."
			end
			@showPrefSummary[facultycourse.id] = {:faculty =>Faculty.find_by_id(facultycourse.faculty_id),
				:course => course , :prefids => prefids , :note => @note} 
		end

  	 	@faculty_courses = FacultyCourse.order(:id)
  		  	respond_to do |format|
  		   	format.html
    	 	format.csv {send_data text: @faculty_courses.to_csv}
    	 	format.xls #{send_data text: @faculty_courses.to_csv(col_sep: "\t")}
   		end

	else
			flash[:error] = "Please choose semester"
			redirect_to root_path
		end

	end
end
