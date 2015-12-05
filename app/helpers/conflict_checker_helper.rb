# @author: Abhishek Vinod Kumar Joshi
# @author: Aqib Niaz Bhat
# Helper class for the Conflict Checker page
module ConflictCheckerHelper
	
	# This method is used to get the course details from the DB using the course id
	# @param courseId The id of the course
	def courseDetails(courseId)
		courseTable = Course.all
		courseId = courseId.to_i
		courseTable.each do |courseRow|
			if courseRow.id == courseId
				return courseRow
			end
		end
	end
	
	# This method is used to get the faculty details from the DB using the course id
	# @param courseId The id of the course
	def findFacultyforCourse(courseId)
		facultycourseTable = FacultyCourse.where("semester_id = ?",@semester_id)
		courseId = courseId.to_i
		facultycourseTable.each do |facultycourserow|
			if ((facultycourserow.course1_id == courseId) || (facultycourserow.course2_id == courseId) || (facultycourserow.course3_id == courseId))
				return facultycourserow.faculty_id
			end

		end
	end
	
	# This method is used to get the ids of the courses that a faculty is teaching using the faculty-course matching id
	# @param faculty_course_id The faculty-course matching id
	def findCoursesForFaculty(faculty_course_id)
		returnArray = Array.new
		i = 0
		facultycourseTable = FacultyCourse.where("semester_id = ?",@semester_id)
		faculty_course_id = faculty_course_id.to_i
		facultycourseTable.each do |facultycourserow|
			if (facultycourserow.id == faculty_course_id)
				if(facultycourserow.course1_id)
					returnArray.insert(i, facultycourserow.course1_id)
					i += 1
				end
				if(facultycourserow.course2_id)
					returnArray.insert(i, facultycourserow.course2_id)
					i += 1
				end
				if(facultycourserow.course3_id)
					returnArray.insert(i, facultycourserow.course3_id)
				end
				return returnArray
			end

		end
	end

	# This method is used to get the name of the faculty using the faculty id
	# @param facultyId The faculty id
	def findFacultyName(facultyId)
		facultyTable = Faculty.all
		facultyId = facultyId.to_i
		facultyTable.each do |facultyrow|
			if facultyrow.id == facultyId
				return facultyrow.faculty_name
			end
		end
	end
	
	# This method is used to the details of a building using the building id
	# @param buildingId The building id
	def findBuildingDataFromId(buildingId)
		buildingTable = Building.all
		if buildingId != ""
			buildingId = buildingId.to_i
			buildingTable.each do |buildingrow|
				if buildingrow.id == buildingId
					return buildingrow
				end
			end
			return ""
		else
			return ""
		end
	end
	
	# This method is used to get the details of a day combination using the day combination id
	# @param dayComboId The day combination id
	def findDayCombinationDataFromId(dayComboId)
		daycomboTable = DayCombination.all
		dayComboId = dayComboId.to_i
		daycomboTable.each do |dcrow|
			if dcrow.id == dayComboId
				return dcrow
			end
		end
	end
	
	# This method is used to find the details of the time slot using the time slot id
	# @param timeSlotId The time slot id
	def findTimeSlotDataFromId(timeSlotId)
		timeslotTable = TimeSlot.all
		timeSlotId = timeSlotId.to_i
		timeslotTable.each do |timeslotrow|
			if timeslotrow.id == timeSlotId
				return timeslotrow
			end
		end
	end
	
	# This method returns "Yes" if the assignment has already been done for the given details
	# @param buildingId The building id
	# @param dayComboId The day combination id
	# @param timeslotId The time slot id
	# @param courseName The course name
	# @param facultyName The faculty name
	def isAssigned(buildingId, dayComboId, timeslotId, courseName, facultyName)
		if CourseAssignment.count > 0
			@semester_id = session[:semester_id]
			@semester_id = @semester_id.to_i
			@CaTable = CourseAssignment.where("semester_id = ?", @semester_id)
			timeSlotId = timeSlotId.to_i
			dayComboId = dayComboId.to_i
			buildingId = buildingId.to_i
			
			@CaTable.each do |caRow|
				@room_id = caRow.room_id
				@building_id = getBuildingIdfromRoom(@room_id)		
				if caRow.day_combination_id == dayComboId && caRow.time_slot_id == timeslotId && (buildingId == 0 || @building_id == buildingId)  && 
					courseName == (courseDetails(caRow.course_id)).course_name && facultyName == findFacultyName(caRow.faculty_id)
					return "Yes"
				end
			end
		end
		return "No"
	end
	
	# This method is used to get the time slot ids for a given time range and day combination
	# @param dayComboId The day combination id
	# @param timeRange The time range
	def getTimeSlotsForDayComboAndRange(dayComboId, timeRange)
		timeranges = TimeRange.all
		dayComboId = dayComboId.to_i
		timeranges.each do |tr|
			if (tr.day_combination_id == dayComboId && tr.t_range == timeRange)
				return (tr.t_slots).split(',')
			end
		end
	end

	# This method is used to get the building id for a given room id
	# @param roomId The room id
	def getBuildingIdfromRoom(roomId)
	
		roomTable = Room.all
		roomId = roomId.to_i
		roomTable.each do |r|
			
			if r.id == roomId
				return r.building_id
			end
		end
	end
	
	# This method returns true if the building entered by the user matches with that of a preference or was not enetered at all
	# @param buildingInput The building chosen by the user as an input on the Conflict Checker page
	# @param preference A given preference for which we need to check
	# @param buildingRowData A building's data for which we need to check
	def checkBuildingOnInput(buildingInput, preference, buildingRowData)
		if buildingInput ==""
			return true
		else
			if preference.building_id == buildingRowData.id
				return true
			else
				return false
			end
		end
	
	end

# End of the class		
end

