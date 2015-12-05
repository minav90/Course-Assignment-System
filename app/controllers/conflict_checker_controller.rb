# @author: Aqib Niaz Bhat
# @author: Abhishek Vinod Kumar Joshi
# Controller class for the Conflict Checker page
class ConflictCheckerController < ApplicationController
# Inlcuding the Helper class for Conflict Checker
include ConflictCheckerHelper

  # Handles request to display the landing page for the feature
  def index

	if ((session[:semester_id] == nil) || (session[:semester_id] == ""))
		flash[:error] = "Please choose a semester"
		redirect_to root_path
	else
	    @dayCombos = DayCombination.all
	    
	    buildings_table_values = Building.all
	    
	    @buildings = Array.new
	    
	    @buildings.insert(0, "")
	    
	    i = 1
	    buildings_table_values.each do |b|
	    	@buildings.insert(i, [b.id, b.building_name])
	    	i+=1
	    end 
	    if (!session[:computed] || session[:computed] == nil)
	    
	    	@conflicts = []
	    	session[:computed] = false
	    	session[:conflicts] = @conflicts
	    	@day_row_id = 1
	    	@time_range_selected = 'Early morning'
	    	@building_row_id = 0
	    else
	    	@conflicts = session[:conflicts]
	    	@day_row_id = session[:dayComboId]
	    	@time_range_selected = session[:timeRanges]
	    	@building_row_id = session[:buildingId]
	    	
	    	# Resetting session data
	    	session[:conflicts] = []
	    	session[:dayComboId] = 1
			session[:timeRanges] = 'Early morning'
			session[:buildingId] = 0
	    end
	end

  end
  
  # Creates the objects whose data needs to be displayed on the page
  def create  	
  	
    day_combo_row = findDayCombinationDataFromId(params["conflict_checker"]["day_combinations_id"])
    # Call the method to get the time slots based on the day combination and range chosen by the user
    relevantTSlots = getTimeSlotsForDayComboAndRange(params["conflict_checker"]["day_combinations_id"], params["conflict_checker"]["time_ranges"])
    building_row = findBuildingDataFromId(params["conflict_checker"]["buildings_id"])
    
    building = params["conflict_checker"]["buildings_id"]
    
    # Call the method to store the user inputs in the session
    setInputsInSession()

    @semester_id = session[:semester_id]

    relevant_preferences = Array.new # Course Name, Course Title, Faculty name, preference, preference #
    i = 0
    
    @conflicts = Array.new # Array to store conflict data: Faculty Name, Course Name, Course Title, Time-Slot, Building name, Note, Preference #, Assigned?
    
    faculty_preferences = FacultyPreference.where("semester_id = ?",@semester_id)
    
    relevantTSlots.each do |relevantTSlot|
    	time_slot_row = findTimeSlotDataFromId(relevantTSlot)
    	faculty_preferences.each do |faculty_preference|

        	pref1_id = faculty_preference.preference1_id
        	pref_1 = Preference.find_by id: pref1_id
        	pref2_id = faculty_preference.preference2_id
        	pref_2 = Preference.find_by id: pref2_id
        	pref3_id = faculty_preference.preference3_id
        	pref_3 = Preference.find_by id: pref3_id

		course_ids = findCoursesForFaculty(faculty_preference.faculty_course_id)
		course_ids.each do |courseID|

		  courseRow = courseDetails(courseID)
		  course_name = courseRow.course_name
		  course_title = courseRow.CourseTitle	 
		 
		  faculty_id = findFacultyforCourse(courseID)
		  faculty_name = findFacultyName(faculty_id)
		  # Check Pref 1
		  if ( (pref_1) && (day_combo_row) && (time_slot_row) &&
		 	  (pref_1.day_combination_id == day_combo_row.id) && ((findTimeSlotDataFromId((pref_1.time_slot_id)).time_slot == time_slot_row.time_slot)) && checkBuildingOnInput(building, pref_1, building_row))
		 
		    relevant_preferences.insert(i, [course_name, course_title, faculty_name, pref_1, 1])
		    i += 1
				
		  end
		 
		  # Check Pref 2
		  if ( (pref_2) && (day_combo_row) && (time_slot_row) && 
		 	(pref_2.day_combination_id == day_combo_row.id) && ((findTimeSlotDataFromId((pref_2.time_slot_id)).time_slot == time_slot_row.time_slot)) && checkBuildingOnInput(building, pref_2, building_row))	
		 
		    relevant_preferences.insert(i, Array[course_name, course_title, faculty_name, pref_2, 2])
		    i += 1
				
		  end
		 
		  # Check Pref 3
		  if ( (pref_3) && (day_combo_row) && (time_slot_row) && 
		 	(pref_3.day_combination_id == day_combo_row.id) && ((findTimeSlotDataFromId((pref_3.time_slot_id)).time_slot == time_slot_row.time_slot)) && checkBuildingOnInput(building, pref_3, building_row))
		 
		    relevant_preferences.insert(i, Array[course_name, course_title, faculty_name, pref_3, 3])
		    i += 1
				
		  end

		end
		 
    	end
    end

    # Call the method to get the conflicts from the relevant preferences
    @conflicts = getConflictsFromRelevantPreferences(relevant_preferences)
    
    session[:computed] = true
    session[:conflicts] = @conflicts
  	redirect_to conflict_checker_index_path
  end

  # This method stores the user inputs in the session
  def setInputsInSession()
    session[:dayComboId] = params["conflict_checker"]["day_combinations_id"]
    session[:timeRanges] = params["conflict_checker"]["time_ranges"]
    session[:buildingId] = params["conflict_checker"]["buildings_id"]
  end

  # This method gets the conflicts from relevant preferences
  # @param relevant_preferences The relevant (based on the search inputs) preferences gathered in create
  def getConflictsFromRelevantPreferences(relevant_preferences)
    conflicts = Array.new
    j = 0

    relevant_preferences.each do |relevant_preference|

      # Faculty Name
      fac_name = relevant_preference[2]
      # Course Details
      cour_name = relevant_preference[0] # .course_name
      cour_title = relevant_preference[1] # .CourseTitle
      # Day-Combo
      day_combo = (findDayCombinationDataFromId((relevant_preference[3]).day_combination_id)).day_combination
      # Time-Slot
      time_slot = (findTimeSlotDataFromId((relevant_preference[3]).time_slot_id)).time_slot
      # Building
      res = findBuildingDataFromId((relevant_preference[3]).building_id)
      if res != ""
        building_name = (res).building_name
      else
        building_name = ""
      end
      # Note
      note = relevant_preference[3].note
      # Preference number
      pref_no = relevant_preference[4]
      # Variable to check course has been assigned to a slotAlready Assigned
      already_asgn = isAssigned((relevant_preference[3]).building_id, (relevant_preference[3]).day_combination_id, (relevant_preference[3]).time_slot_id, cour_name, fac_name)

      conflicts.insert(j, Array[fac_name, cour_name, cour_title, day_combo, time_slot, building_name, note, pref_no, already_asgn])
      j += 1

    end

    return conflicts
  # end of the method
  end

# end of the class
end

