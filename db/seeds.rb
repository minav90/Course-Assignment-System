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

faculties = [{:faculty_name => 'Dr. Andrew Jiang'},
			 {:faculty_name => 'Dr. Thomas Ioerger'},
			 {:faculty_name => 'Dr. Jianer Chen'},
			 {:faculty_name => 'Dr. Jeff Huang'},
			 {:faculty_name => 'Dr. Duncan Walker'},
			 
			]

courses = 	[{:course_name => 'Introduction to Artificial Intelligence'},
			 {:course_name => 'Analysis of Algorithms Section 1'},
			 {:course_name => 'Analysis of Algorithms Section 2'},
			 {:course_name => 'Software Engineering'},
			 
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

preferences = 	[{:building_id => '1', :day_combination_id => '2', :time_slot_id => '14'},
				 {:building_id => '1', :day_combination_id => '2', :time_slot_id => '13'},
				 {:building_id => '1', :day_combination_id => '2', :time_slot_id => '12'},
				 {:building_id => '1', :day_combination_id => '2', :time_slot_id => '11'},
				 {:building_id => '1', :day_combination_id => '2', :time_slot_id => '10'},
				 {:building_id => '2', :day_combination_id => '2', :time_slot_id => '9'},
				 {:building_id => '2', :day_combination_id => '1', :time_slot_id => '8'},
				 {:building_id => '2', :day_combination_id => '3', :time_slot_id => '7'},
				 {:building_id => '2', :day_combination_id => '3', :time_slot_id => '6'},
				 {:building_id => '2', :day_combination_id => '3', :time_slot_id => '5'},
				 {:building_id => '3', :day_combination_id => '3', :time_slot_id => '4'},
				 {:building_id => '3', :day_combination_id => '3', :time_slot_id => '3'},
				 {:building_id => '3', :day_combination_id => '3', :time_slot_id => '2'},
				 {:building_id => '3', :day_combination_id => '3', :time_slot_id => '1'},
			 
				]	

facultycourses = [{:faculty_id => '1', :course_id => '2'},
				  {:faculty_id => '2', :course_id => '1'},
				  {:faculty_id => '3', :course_id => '3'},
				  {:faculty_id => '5', :course_id => '4'},
			 
				 ]	
				 
facultypreferences = [{:faculty_course_id => '1', :preference1_id => '1', :preference1_id => '2', :preference1_id => '3'},
					  {:faculty_course_id => '2', :preference1_id => '3', :preference1_id => '4', :preference1_id => '5'},
					  {:faculty_course_id => '3', :preference1_id => '5', :preference1_id => '7', :preference1_id => '6'},
				      {:faculty_course_id => '4', :preference1_id => '7', :preference1_id => '11', :preference1_id => '10'},
			 
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

preferences.each do |pf|
  Preference.create!(pf)
end

facultypreferences.each do |fpf|
  FacultyPreference.create!(fpf)
end

#Preference.destroy(1)

#FacultyPreference.all.each do |fp|
#	puts fp[:id]
#end



