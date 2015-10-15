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
			 {:course_name => 'Dr. Tracy Hammond'},
			 {:course_name => 'Dr. Daniel Jiminez'},
			 
			]
			
8:00 am to 8:50 am
9:10 am to 10:00 am
10:20 am to 11:10 am
11:30 am to 12:10 pm
12:40 pm to 1:30 pm
1:50 pm to 2:40 pm
3:00 pm to 3:50 pm

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

buildings.each do |building|
  Building.create!(building)
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

Building.all.each do |building|
	puts building[:building_name]
	puts building[:id]
end

Building.destroy(1)

Building.all.each do |building|
	puts building[:building_name]
	puts building[:id]
end

Room.all.each do |room|
	puts room[id] + room[:room_name]+ "\t"+ room[:building_id]
end


