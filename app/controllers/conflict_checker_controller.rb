class ConflictCheckerController < ApplicationController
  def index
    @faculty_courses = FacultyCourse.all #course1_id, course2_id, course3_id, faculty_id, semester_id
    @preferences = Preference.all #building_id (optional), day_combination_id, time_slot_id, semester_id
    @faculty_preferences = FacultyPreference.all #faculty_course_id, preference1_id, preference2_id, preference3_id, semester_id
    #@conflicts = 
=begin
1.  @faculty_preferences.each do |faculty_preference_outer|
      @faculty_preferences.each do |faculty_preference_inner|
	if(faculty_preference_outer.faculty_course_id != faculty_preference_inner.faculty_course_id){
	  if(faculty_preference_outer.preference1_id == faculty_preference_inner.preference1_id)
	}
      end
    end

2.  @conflicts = FacultyPreference.where()

3.  FacultyPreference.all.each do |faculty_preference|
      
    end

4.  @conflicts = FacultyPreference.select("column_1 as coulumn_name, ...").group(preference1_id) #to order by: .order(:day_combination_id)
Get prefs 1, 2 & 3. Check which have the day-combo and time slots. These will be the conflicts.
Show the building, day-combo, time-slot and faculty for the conflicts (group by building name, day-combo and time-slots)
When assignment is done, then we show more details
=end
   @conflicts = FacultyPreference.find_by_sql("SELECT *, COUNT(*) FROM faculty_preferences GROUP BY preference1_id HAVING COUNT(*) > 1")
  end
end

