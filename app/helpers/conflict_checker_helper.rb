module ConflictCheckerHelper
	def courseDetails(courseId)
		courseTable = Course.all
		courseId = courseId.to_i
		courseTable.each do |courseRow|
			if courseRow.id == courseId
				return courseRow
			end
		end
	end
	
	def findFacultyforCourse(courseId)
		facultycourseTable = FacultyCourse.all
		courseId = courseId.to_i
		facultycourseTable.each do |facultycourserow|
			if facultycourserow.id == courseId
				return facultycourserow.id # @facultyid = 
			end
		end
	end
	
	def findFacultyName(facultyId)
		facultyTable = Faculty.all
		facultyId = facultyId.to_i
		facultyTable.each do |facultyrow|
			if facultyrow.id == facultyId
				return facultyrow.faculty_name # @facultyName = 
			end
		end
	end
	
	def findBuildingDataFromId(buildingId)
		buildingTable = Building.all
		buildingId = buildingId.to_i
		buildingTable.each do |buildingrow|
			if buildingrow.id == buildingId
				return buildingrow
			end
		end
	end
	
	def findDayCombinationDataFromId(dayComboId)
		daycomboTable = DayCombination.all
		dayComboId = dayComboId.to_i
		daycomboTable.each do |dcrow|
			if dcrow.id == dayComboId
				return dcrow
			end
		end
	end
	
	def findTimeSlotDataFromId(timeSlotId)
		timeslotTable = TimeSlot.all
		timeSlotId = timeSlotId.to_i
		timeslotTable.each do |timeslotrow|
			if timeslotrow.id == timeSlotId
				return timeslotrow
			end
		end
	end
	
	def isAssigned(buildingId, dayComboId, timeslotId, courseName, facultyName)
		puts "Count is ....."
		puts CourseAssignment.count
		if CourseAssignment.count > 0
			@CaTable = CourseAssignment.all
			timeSlotId = timeSlotId.to_i
			dayComboId = dayComboId.to_i
			buildingId = buildingId.to_i
			
			@CaTable.each do |caRow|
				@room_id = caRow.room_id
				@building_id = getBuildingIdfromRoom(@room_id)	
				
				
				if caRow.day_combination_id == dayComboId && caRow.time_slot_id == timeslotId && (@building_id == nil || @building_id == buildingId) && 
					courseName == (courseDetails(caRow.course_id)).course_name && facultyName == findFacultyName(caRow.faculty_id)
					return "Yes"
				end
			end
		end
		return "No"
	end
	
	def getBuildingIdfromRoom(roomId)
	
		@roomTable = Room.all
		roomId = roomId.to_i
		@roomTable.each do |r|
			
			if r.id == roomId
				return r.building_id
			end
		end
	end
	
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
		
end
