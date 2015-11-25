class CourseAssignmentsController < ApplicationController
  def show

  end

  def index
	if session[:semester_id] != nil && session[:semester_id] != ""
		@faculties = Faculty.order(faculty_name: :desc)
		@assignments = []
		@faculties.each {|faculty|
	    		course_assignments = CourseAssignment.includes(:course,:room,:day_combination,:time_slot).where("semester_id = ? and faculty_id = ?",session[:semester_id],faculty.id)
	    		course_assignments.each {|course_assignment|	
			course1_name = ""
			course2_name = ""
			course3_name = ""
			course_name = course_assignment.course.course_name + " " + course_assignment.course.CourseTitle
			assign_str = ""
			if course_assignment.room_id != nil
				room = course_assignment.room
				building = Building.find(room.building_id)
				assign_str += building.building_name
				assign_str += " " + room.room_name
			end
			if course_assignment.day_combination_id != nil
				assign_str += " " + course_assignment.day_combination.day_combination
			end
			if course_assignment.time_slot_id != nil
				assign_str += " " + course_assignment.time_slot.time_slot
			end
			
	    		@assignments << {"faculty_name" => faculty.faculty_name, "course_name" => course_name, "assign" => assign_str}
	    		}
		}
	else
		flash[:error] = "Please choose semester"
		redirect_to root_path
	end
  end

  def update_course_assignment
	attributes = {}
	faculty_id = params[:faculty_id]
        course_id = params[:course_id]
	course_assignments = CourseAssignment.includes(:course,:faculty).where("semester_id = ? and course_id = ?",session[:semester_id],course_id)
	course_assignment = nil
	has_updated = false
	if course_assignments.length > 0
		course_assignment = course_assignments[0]
		faculty = course_assignment.faculty
		course = course_assignment.course
	end
	if params["building_select_#{course_id}"] == ""
		if course_assignment == nil
			flash[:error] = "Cannot create empty assignment"
		else
			CourseAssignment.destroy(course_assignment.id)
			flash[:success] = "Deleted course assignment for " + faculty.faculty_name + ", " + course.course_name
			has_updated = true
		end
	else
		attributes[:room_id] = params["room_select_#{course_id}"]
                attributes[:day_combination_id] = params["day_combination_select_#{course_id}"]
                attributes[:time_slot_id] = params["time_slot_select_#{course_id}"]
		duplicate_assignment = CourseAssignment.where("semester_id = ? and room_id = ? and day_combination_id = ? and time_slot_id = ?",session[:semester_id],attributes[:room_id],attributes[:day_combination_id],attributes[:time_slot_id])
		if duplicate_assignment.length > 1 || (duplicate_assignment.length == 1 && duplicate_assignment[0].course_id != course_id)
			flash[:error] = "Assignment already exists for the chosen building, room, day combination and time slot"
		elsif course_assignment == nil
			attributes[:semester_id] = session[:semester_id]
			attributes[:faculty_id] = faculty_id
			attributes[:course_id] = course_id
			course_assignment = CourseAssignment.includes(:course,:faculty).create!(attributes)
			faculty = course_assignment.faculty
			course = course_assignment.course
			flash[:success] = "Created course assignment for " + faculty.faculty_name + ", " + course.course_name
			has_updated = true
		else
        		course_assignment.update_attributes!(attributes)
			flash[:success] = "Updated course assignment for " + faculty.faculty_name + ", " + course.course_name
			has_updated = true
		end
	end
	respond_to do |format|
		format.js {render inline: "location.reload();" }
	end
  end

  def update_faculty_details
	# add semester id to query
	faculty_courses_arr = FacultyCourse.includes(:course1,:course2,:course3).where("faculty_id = ?",params[:faculty_id])
	if faculty_courses_arr.length == 0
		@course_assignments = []	
	else
		faculty_courses = faculty_courses_arr[0]
		@courses = build_courses_object([faculty_courses.course1,faculty_courses.course2,faculty_courses.course3])
		@course_assignments = CourseAssignment.includes(:room).where("semester_id = ? and faculty_id = ?",session[:semester_id],params[:faculty_id])
		@buildings = Building.all
		@assigned_building_ids = {}
		@courses.each_key {|key|
			setup_course_assignment(params[:faculty_id],key)
		}
	end
	respond_to do |format|
		format.js
	end
  end

  def setup_course_assignment(faculty_id,course_id)
	@course_assignments.each {|course_assignment|
		if course_assignment.course_id == course_id
			if course_assignment.room_id != nil
                                building_id = course_assignment.room.building_id
                        else
                                building_id = ""
                        end
                        @assigned_building_ids[course_id] = building_id
			return
		end
	}
	course_assign = CourseAssignment.new(semester_id: session[:semester_id],faculty_id: faculty_id, course_id: course_id)
	@course_assignments << course_assign
	@assigned_building_ids[course_id] = ""
	return
  end

  def get_course_assignment(course_id)
	course_assignments = CourseAssignment.where("semester_id = ? and course_id = ?",session[:semester_id],params[:course_id])
	if course_assignments.length > 0
		course_assignment = course_assignments[0]
	else
		course_assignment = CourseAssignment.new(semester_id: session[:semester_id], course_id: course_id)
	end
  end
  
  def update_room
	@room_options = {}
	@room_options["data"] = {}
	rooms = Room.where("building_id = ?",params[:building_id])
	if rooms.length == 0
		@room_options["data"][""] = ""
	else
		rooms.each {|room|
			@room_options["data"][room.id.to_s] = room.room_name
		}
	end
	@room_options["select_id"] = "#room_select_" + params[:course_id]
	course_assignment = get_course_assignment(params[:course_id])
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
	classroom_timings = ClassroomTiming.includes(:day_combination).where("room_id = ?",params[:room_id])
	if classroom_timings.length == 0
		@day_combination_options["data"][""] = ""
	else
		classroom_timings.each {|classroom_timing|
			day_combination = classroom_timing.day_combination
			@day_combination_options["data"][day_combination.id.to_s] = day_combination.day_combination
		}
	end
	@day_combination_options["select_id"] = "#day_combination_select_" + params[:course_id]
	course_assignment = get_course_assignment(params[:course_id])
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
	classroom_timings = ClassroomTiming.includes(:time_slot).where("day_combination_id = ?",params[:day_combination_id])
	if classroom_timings.length == 0
                @time_slot_options["data"][""] = ""
	else
		classroom_timings.each {|classroom_timing|
                	time_slot = classroom_timing.time_slot
                	@time_slot_options["data"][time_slot.id.to_s] = time_slot.time_slot
        	}
	end
	@time_slot_options["select_id"] = "#time_slot_select_" + params[:course_id]
	course_assignment = get_course_assignment(params[:course_id])
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

  def build_courses_object(course_arr)
 	courses = {}
	course_arr.each {|course|
		if course != nil
			if course.course_name != ""
				courses[course.id] = course.course_name + " " + course.CourseTitle
			end
		end
	}  	
	return courses
  end
end
