class CourseAssignmentsController < ApplicationController
  def show

  end

  def index
	@faculties = Faculty.order(faculty_name: :desc)	
  end

  def update_course_assignment
	attributes = {}
	faculty_id = params[:faculty_id] 
	course_id = params[:course_id]
	course_assignment = CourseAssignment.where("faculty_id = ? and course_id = ?",faculty_id,course_id)
	attributes[:room_id] = params["room_select_#{course_id}"]
	attributes[:day_combination_id] = params["day_combination_select_#{course_id}"]
	attributes[:time_slot_id] = params["time_slot_select_#{course_id}"]
	course_assignment.update_all(attributes)
	respond_to do |format|
		format.js
	end	
  end

  def update_faculty_details
	faculty_courses = FacultyCourse.find_by_faculty_id(params[:faculty_id])
	@courses = build_courses_object([faculty_courses.course1_id,faculty_courses.course2_id,faculty_courses.course3_id])
	@course_assignments = CourseAssignment.where("faculty_id = ?",params[:faculty_id])
	@buildings = Building.all
	@assigned_building_ids = {}
	if @course_assignments == []
		@courses.each_key {|key|
			course_assgnment = create_new_course_assignment(params[:faculty_id],key)
			@course_assignments << course_assgnment
			@assigned_building_ids[key] = ""
		}
	else
		@course_assignments.each {|course_assignment|
			if course_assignment.room_id != nil
				room = Room.find(course_assignment.room_id)
				building_id = room.building_id
			else
				building_id = ""
			end
			@assigned_building_ids[course_assignment.course_id] = building_id
		}
	end
	respond_to do |format|
		format.js
	end
  end

  def create_new_course_assignment(faculty_id,course_id)
	course_assign = CourseAssignment.create!(faculty_id: faculty_id, course_id: course_id)
  end
  
  def update_room
	@room_options = {}
	@room_options["data"] = {}
	rooms = Room.where("building_id = ?",params[:building_id])
	rooms.each {|room|
		@room_options["data"][room.id.to_s] = room.room_name
	}
	@room_options["select_id"] = "#room_select_" + params[:course_id]
	course_assignment = CourseAssignment.where("course_id = ?",params[:course_id])[0]
	room_id = course_assignment.room_id.to_s
	if room_id != nil
		@room_options["selected_val"] = room_id
	else
		@room_options["selected_val"] = ""
	end
	respond_to do |format|
		format.json {render json: @room_options}
	end
  end

  def update_day_combination
	@day_combination_options = {}
	@day_combination_options["data"] = {}
	classroom_timings = ClassroomTiming.where("room_id = ?",params[:room_id])
	classroom_timings.each {|classroom_timing|
		day_combination = DayCombination.find(classroom_timing.day_combination_id)
		@day_combination_options["data"][day_combination.id.to_s] = day_combination.day_combination
	}
	@day_combination_options["select_id"] = "#day_combination_select_" + params[:course_id]
	course_assignment = CourseAssignment.where("course_id = ?",params[:course_id])[0]
	day_combination_id = course_assignment.day_combination_id.to_s
	if day_combination_id != nil
		@day_combination_options["selected_val"] = day_combination_id
	else
		@day_combination_options["selected_val"] = ""
	end
	respond_to do |format|
		format.json {render json: @day_combination_options}
	end
  end

  def update_time_slot
	@time_slot_options = {}
	@time_slot_options["data"] = {}
	classroom_timings = ClassroomTiming.where("day_combination_id = ?",params[:day_combination_id])
	classroom_timings.each {|classroom_timing|
                time_slot = TimeSlot.find(classroom_timing.time_slot_id)
                @time_slot_options["data"][time_slot.id.to_s] = time_slot.time_slot
        }
	@time_slot_options["select_id"] = "#time_slot_select_" + params[:course_id]
	course_assignment = CourseAssignment.where("course_id = ?",params[:course_id])[0]
	time_slot_id = course_assignment.time_slot_id.to_s
	if time_slot_id != nil
		@time_slot_options["selected_val"] = time_slot_id
	else
		@time_slot_options["selected_val"] = ""
	end
	respond_to do |format|
		format.json {render json: @time_slot_options}
	end	
  end

  def build_courses_object(course_ids)
 	courses = {}
	course_ids.each {|course_id|
		if course_id != nil && course_id != ""
			course = Course.find(course_id)
			if course != nil && course.course_name != ""
				courses[course_id] = course.course_name
			end
		end
	}  	
	return courses
  end
end
