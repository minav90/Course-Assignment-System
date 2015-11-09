class ConflictCheckerController < ApplicationController
  def index

    # @building_row = Building.find_by building_name: params[:building]
    @building_row = Building.find_by building_name: "HRBB"
    # @day_combo_row = DayCombination.find_by day_combination: params[:day_combo]
    @day_combo_row = DayCombination.find_by day_combination: "TR"
    # @time_slot = params[:time_slot]
    @time_slot = "Please select ..."
 
    # Data/columns to be shown in @conflicts: Faculty Name, Course Details, Time-Slot (Group By), Note, Preference number, Already Assigned
    # ToDo: Get the semester_id from the session
    @semester_id = 1

    @relevant_preferences = Array.new # faculty_course_id (Faculty Name, Course Name), preference_num, note, time_slot_id (Time-slot)
    i = 0
    j = 0
    @conflicts = Array.new

    # If time-slot was not chosen (=> only Building and Day-Combo were chosen)
    case @time_slot
    when "Please select ..."
       # @faculty_preferences = FacultyPreference.find_by semester_id: @semester_id
       @faculty_preferences = FacultyPreference.all

       @faculty_preferences.each do |faculty_preference|

         @pref1_id = faculty_preference.preference1_id
         @pref_1 = Preference.find_by preference1_id: @pref1_id
         @pref2_id = faculty_preference.preference2_id
         pref_2 = Preference.find_by preference_id: @pref2_id
         @pref3_id = faculty_preference.preference3_id
         @pref_3 = Preference.find_by preference_id: @pref3_id

	 @course_id = faculty_preference.faculty_course_id
	 # Now using course_id, get course name & title from Course using helper method
	 @courseRow = ConflictCheckerHelper.courseDetails(@course_id)
	 # Then using course_id, get faculty_id from FacultyCourse using helper method
	 @faculty_id = ConflictCheckerHelper.findFacultyforCourse(@course_id)
	 # Now using faculty_id, get faculty_name from Faculty using helper method
	 @faculty_name = ConflictCheckerHelper.findFacultyName(@faculty_id)

         # Check Pref 1
         # @pref_1 = Preference.find_by preference_id: @pref1_id
	 if (@pref_1.building_id == @building_row.building_id) && (@pref_1.day_combination_id == @day_combo_row.day_combination_id)
	    @relevant_preferences.insert(i, Array[@courseRow.course_name, @courseRow.course_title, @faculty_name, @pref_1, 1])
	    i += 1
	 end
         # Check Pref 2
	 if ( (@pref_2.building_id == @building_row.building_id) && (@pref_2.day_combination_id == @day_combo_row.day_combination_id) )
	    @relevant_preferences.insert(i, Array[@courseRow.course_name, @courseRow.course_title, @faculty_name, @pref_2, 2])
	    i += 1
	 end
         # Check Pref 3
	 if ( (@pref_3.building_id == @building_row.building_id) && (@pref_3.day_combination_id == @day_combo_row.day_combination_id) )
	    @relevant_preferences.insert(i, Array[@courseRow.course_name, @courseRow.course_title, @faculty_name, @pref_3, 3])
	    i += 1
	 end  
       
       end

       @relevant_preferences.each do |relevant_preference|
        # Faculty Name
	@fac_name = relevant_preference[2]
	# Course Details
	@cour_name = relevant_preference[0]
	@cour_title = relevant_preference[1]
	# Time-Slot (Group By)
	@time_slot = ConflictCheckerHelper.findTimeSlotDataFromId(relevant_preference[3].time_slot_id).time_slot
	# Note
	@note = relevant_preference[3].note
	# Preference number
	@pref_no = relevant_preference[4]
	# Already Assigned
	@already_asgn = True
	#@already_asgn = ConflictCheckerHelper.isAssigned(relevant_preference[3].building_id, relevant_preference[3].day_combination_id, relevant_preference[3].time_slot_id)

        @conflicts.insert(j, Array[@fac_name, @cour_name, @cour_title, @time_slot, @note, @pref_no, @already_asgn])
	j += 1
       end

    else
       # @time_slot_row = TimeSlot.find_by time_slot: params[:time_slot]
       
       # @conflicts = 

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
7. Course: course_id (i), course_name (s), course_title (s)
8. FacultyCourse: faculty_id (i), course1_id (i), course2_id (i), course3_id (i), semester_id (i)
9. Faculty: faculty_id (i), faculty_name (s)
10. CourseAssignment: faculty_id (i), course_id (i), room_id (i), day_combination_id (i), time_slot_id (i), semester_id (i)
=end
