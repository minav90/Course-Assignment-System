class ConflictCheckerController < ApplicationController
  def index
    @building_row = Building.find_by building_name: params[:building]
    @day_combo_row = DayCombination.find_by day_combination: params[:day_combo]
 
    # Data/columns to be shown in @conflicts: Faculty Name, Course Name, Time-Slot (Group By), Note, Preference number, Already Assigned
    # Get the semester_id from the session
    @semester_id = params[:semester_id]

    @relevant_preferences = Array.new # faculty_course_id (Faculty Name, Course Name), preference_num, note, time_slot_id (Time-slot)
    i = 0

    # If time-slot was not chosen (=> only Building and Day-Combo were chosen)
    if (@time_slot == "Please select ...") {

       @faculty_preferences = FacultyPreference.find_by semester_id: @semester_id

       @faculty_preferences.each do |faculty_preference|
         @pref1_id = faculty_preference.preference1_id
         @pref_1 = Preference.find_by preference_id: @pref1_id
         @pref2_id = faculty_preference.preference2_id
         @pref_2 = Preference.find_by preference_id: @pref2_id
         @pref3_id = faculty_preference.preference3_id
         @pref_3 = Preference.find_by preference_id: @pref3_id

         # Check Pref 1
         # @pref_1 = Preference.find_by preference_id: @pref1_id
	 if ( (@pref_1.building_id == @building_row.building_id) && (@pref_1.day_combination_id == @day_combo_row.day_combination_id) )
	    @course_id = faculty_preference.faculty_course_id
	    # Now using course_id, get course name & title from Course using helper method
	    # Then using course_id, get faculty_id from FacultyCourse using helper method
	    # Now using faculty_id, get faculty_name from Faculty using helper method
	    @relevant_preferences.insert(i, Array["Course name & title, Faculty name", @pref_1, 1])
	    i++
	 end
         # Check Pref 2
         
         # Check Pref 3
         
       end

       @conflicts=

    } else {
       @time_slot_row = TimeSlot.find_by time_slot: params[:time_slot]
       
       @conflicts=
    }
    end

    # @conflicts = FacultyPreference.find_by_sql("SELECT *, COUNT(*) FROM faculty_preferences GROUP BY preference1_id HAVING COUNT(*) > 1")
  end
end

=begin
Models and their columns:
1. Building: building_id, building_name (s)
2. Room: room_id, room_name (s), building_id (i), Capacity (i)
3. DayCombination: day_combination_id, day_combination (s)
4. TimeSlot: time_slot_id, time_slot (s)
5. Preference: preference_id, note, building_id, day_combination_id, time_slot_id, semester_id (i)
6. FacultyPreference: faculty_preference_id, faculty_course_id (i), preference1_id (i), preference2_id (i), preference3_id (i), semester_id (i)
7. Course: course_id (i), course_name (s), CourseTitle (s)
8. FacultyCourse: faculty_id (i), course1_id (i), course2_id (i), course3_id (i), semester_id (i)
9. Faculty: faculty_id (i), faculty_name (s)
10. CourseAssignment: faculty_id (i), course_id (i), room_id (i), day_combination_id (i), time_slot_id (i), semester_id (i)
=end
