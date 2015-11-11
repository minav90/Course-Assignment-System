# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

buildings = [{:building_name => 'HRBB'},
			 {:building_name => 'CHEN'},
			 {:building_name => 'FERM'},
			]

rooms = [{:room_name => '124', :building_id => 1},
		 {:room_name => '126', :building_id => 1},
		 {:room_name => '113', :building_id => 1},
		 {:room_name => '303', :building_id => 2},
		 {:room_name => '201', :building_id => 2},
		 {:room_name => '102', :building_id => 3},
		 {:room_name => '106', :building_id => 3},
		 {:room_name => '104', :building_id => 3},
		 {:room_name => '108', :building_id => 3},
		]

		
	 
daycombinations = [{:day_combination => 'MW'},
				   {:day_combination => 'TR'},
				   {:day_combination => 'MWF'},
				]

faculties = [{:faculty_name => 'Jiang Andrew'},
			 {:faculty_name => 'Ioerger Thomas'},
			 {:faculty_name => 'Chen Jianer'},
			 {:faculty_name => 'Huang Jeff'},
			 {:faculty_name => 'Walker Duncan'},
			 
			]

courses = 	[{:course_name => 'Introduction to Artificial Intelligence'},
			 {:course_name => 'Analysis of Algorithms Section 1'},
			 {:course_name => 'Analysis of Algorithms Section 2'},
			 {:course_name => 'Software Engineering'},
			 {:course_name => 'Design Circuits'},
			 {:course_name => 'Analog Design'},
			 {:course_name => 'Machine Learning'},
			]


timeslots = 	[{:time_slot => '8:00 am to 8:50 am'},
				 {:time_slot => '9:10 am to 10:00 am'},
				 {:time_slot => '10:20 am to 11:10 am'},
				 {:time_slot => '11:30 am to 12:10 pm'},
				 {:time_slot => '12:40 pm to 1:30 pm'},
				 {:time_slot => '1:50 pm to 2:40 pm'},
				 {:time_slot => '3:00 pm to 3:50 pm'},
				 {:time_slot => '4:10 pm to 5:25 pm'},
				 {:time_slot => '8:00 am to 9:15 am'},
				 {:time_slot => '9:35 am to 10:50 am'},
				 {:time_slot => '11:10 am to 12:25 pm'},
				 {:time_slot => '12:45 pm to 2:00 pm'},
				 {:time_slot => '2:20 pm to 3:35 pm'},
				 {:time_slot => '3:55 pm to 5:10 pm'},
			 
				]	

preferences = 	[{:semester_id => '1',:building_id => '1', :day_combination_id => '2', :time_slot_id => '14'},
				 {:semester_id => '1',:building_id => '1', :day_combination_id => '2', :time_slot_id => '13'},
				 {:semester_id => '1',:building_id => '1', :day_combination_id => '2', :time_slot_id => '12'},
				 {:semester_id => '1',:building_id => '1', :day_combination_id => '2', :time_slot_id => '11'},
				 {:semester_id => '1',:building_id => '1', :day_combination_id => '2', :time_slot_id => '10'},
				 {:semester_id => '1',:building_id => '2', :day_combination_id => '2', :time_slot_id => '9'},
				 {:semester_id => '1',:building_id => '2', :day_combination_id => '1', :time_slot_id => '8'},
				 {:semester_id => '1',:building_id => '2', :day_combination_id => '3', :time_slot_id => '7'},
				 {:semester_id => '1',:building_id => '2', :day_combination_id => '3', :time_slot_id => '6'},
				 {:semester_id => '1',:building_id => '2', :day_combination_id => '3', :time_slot_id => '5'},
				 {:semester_id => '1',:building_id => '3', :day_combination_id => '3', :time_slot_id => '4'},
				 {:semester_id => '1',:building_id => '3', :day_combination_id => '3', :time_slot_id => '3'},
				 {:semester_id => '1',:building_id => '3', :day_combination_id => '3', :time_slot_id => '2'},
				 {:semester_id => '1',:building_id => '3', :day_combination_id => '3', :time_slot_id => '1'},
			 
				]	

facultycourses = [{:semester_id => '1',:faculty_id => '1', :course1_id => '2'},
				  {:semester_id => '1',:faculty_id => '2', :course1_id => '1'},
				  {:semester_id => '1',:faculty_id => '3', :course1_id => '3', :course2_id => '6'},
				  {:semester_id => '1',:faculty_id => '5', :course1_id => '4', :course2_id => '5'},
				  			 
				 ]	
				 
facultypreferences = [{:semester_id => '1',:faculty_course_id => '1', :preference1_id => '1', :preference3_id => '3'},
					  {:semester_id => '1',:faculty_course_id => '2', :preference1_id => '3', :preference2_id => '4', :preference3_id => '5'},
					  {:semester_id => '1',:faculty_course_id => '3', :preference1_id => '5', :preference2_id => '7', :preference3_id => '6'},
				      {:semester_id => '1',:faculty_course_id => '4', :preference1_id => '7', :preference3_id => '10'},
			 
					]
semesters = [{:SemesterTitle => 'Fall 2015'}]
					
classroomtimings = [{:room_id => '1', :time_slot_id => '1', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '2', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '3', :day_combination_id => '3', :semester_id => '1'},
				    {:room_id => '1', :time_slot_id => '4', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '5', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '6', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '7', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '8', :day_combination_id => '1', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '9', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '10', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '11', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '12', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '13', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '1', :time_slot_id => '14', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '1', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '2', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '3', :day_combination_id => '3', :semester_id => '1'},
				    {:room_id => '2', :time_slot_id => '4', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '5', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '6', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '7', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '8', :day_combination_id => '1', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '9', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '10', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '11', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '12', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '13', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '2', :time_slot_id => '14', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '1', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '2', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '3', :day_combination_id => '3', :semester_id => '1'},
				    {:room_id => '3', :time_slot_id => '4', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '5', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '6', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '7', :day_combination_id => '3', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '8', :day_combination_id => '1', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '9', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '10', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '11', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '12', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '13', :day_combination_id => '2', :semester_id => '1'},
					{:room_id => '3', :time_slot_id => '14', :day_combination_id => '2', :semester_id => '1'},
			 
				]

buildings.each do |building|
  Building.create!(building)
end

facultycourses.each do |fc|
  FacultyCourse.create!(fc)
end

daycombinations.each do |dc|
  DayCombination.create!(dc)
end

faculties.each do |fclt|
  Faculty.create!(fclt)
end

courses.each do |crs|
  Course.create!(crs)
end

timeslots.each do |ts|
  TimeSlot.create!(ts)
end

rooms.each do |room|
  Room.create!(room)
end

semesters.each do |s|
  Semester.create!(s)
end

preferences.each do |pf|
  Preference.create!(pf)
end

facultypreferences.each do |fpf|
  FacultyPreference.create!(fpf)
end

classroomtimings.each do |cts|
  ClassroomTiming.create!(cts)
end

#Preference.destroy(3)

#FacultyPreference.all.each do |fp|
	#puts fp[:id]
#end



