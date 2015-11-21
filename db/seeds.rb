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

rooms = [{:room_name => '124', :building_id => 1, :Capacity => 135},
		 {:room_name => '126', :building_id => 1, :Capacity => 27},
		 {:room_name => '113', :building_id => 1, :Capacity => 60},
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
			 {:faculty_name => 'Huang Ruihong'},
			 {:faculty_name => 'Hu Xia'},
			 {:faculty_name => 'Amato Nancy'},
			 {:faculty_name => 'Bettati Riccardo'},
			 {:faculty_name => 'Chai Jinxiang'},
			 {:faculty_name => 'Caverlee James'},
			 {:faculty_name => 'Choe Yoonsuck'},
			 {:faculty_name => 'Da Silva Dilma'},
			 {:faculty_name => 'Daugherity Walter'},
			 {:faculty_name => 'Davis Tim'},
			 {:faculty_name => 'Furuta Richard'},
			 {:faculty_name => 'Gooch Bruce'},
			 {:faculty_name => 'Gu Guofei'},
			 {:faculty_name => 'Gutierrez-Osuna Ricardo'},
			 {:faculty_name => 'Hammond Tracy Anne'},
			 {:faculty_name => 'Hurley Joseph'},
			 {:faculty_name => 'Jafari Roozbeh'},
			 {:faculty_name => 'Jarvi Jaakko'},
			 {:faculty_name => 'Jiménez Daniel'},
			 {:faculty_name => 'Kerne Andruid'},
			 {:faculty_name => 'Keyser John'},
			 {:faculty_name => 'Kim Eun Jung'},
			 {:faculty_name => 'Klappenecker Andreas'},
			 {:faculty_name => 'Lee Hyunyoung'},
			 {:faculty_name => 'Leyk Teresa'},
			 {:faculty_name => 'Liu Jyh-Charn'},
			 {:faculty_name => 'Loguinov Dmitri'},
			 {:faculty_name => 'Mahapatra Rabi'},
			 {:faculty_name => 'Moore Michael'},
			 {:faculty_name => 'Murphy Robin'},
			 {:faculty_name => 'Ragsdale Daniel'},
			 {:faculty_name => 'Rauchwerger Lawrence'},
			 {:faculty_name => 'Ritchey Philip'},
			 {:faculty_name => 'Sarin Vivek'},
			 {:faculty_name => 'Schaefer Scott'},
			 {:faculty_name => 'Shell Dylan'},
			 {:faculty_name => 'Shipman Frank'},
			 {:faculty_name => 'Song Dezhen'},
			 {:faculty_name => 'Stoleru Radu'},
			 #{:faculty_name => 'Sze Sing-Hoi'},
			 #{:faculty_name => 'Taylor Valerie'},
			 #{:faculty_name => 'Tyagi Aakash'},
			 #{:faculty_name => 'Ward Ronnie'},
			 #{:faculty_name => 'Welch Jennifer'},
			 #{:faculty_name => 'Williams Tiffani'},
			 
			]

courses = 	[{:course_name => 'Introduction to Artificial Intelligence', :CourseTitle => 'CSCE 625'},
			 {:course_name => 'Analysis of Algorithms Section 1', :CourseTitle => 'CSCE 629'},
			 {:course_name => 'Analysis of Algorithms Section 2', :CourseTitle => 'CSCE 629'},
			 {:course_name => 'Software Engineering', :CourseTitle => 'CSCE 606'},
			 {:course_name => 'Design Circuits'},
			 {:course_name => 'Analog Design'},
			 {:course_name => 'Machine Learning', :CourseTitle => 'CSCE 633'},
			 {:course_name => 'Programming with C and Java', :CourseTitle => 'CSCE 601'},
			 {:course_name => 'Object-Oriented Programming, Development and Software Engineering', :CourseTitle => 'CSCE 602'},
			 {:course_name => 'Database Systems and Applications', :CourseTitle => 'CSCE 603'},
			 {:course_name => 'Programming Languages', :CourseTitle => 'CSCE 604'},
			 {:course_name => 'Compiler Design', :CourseTitle => 'CSCE 605'},
			 {:course_name => 'Database Systems', :CourseTitle => 'CSCE 608'},
			 {:course_name => 'Hypertext/Hypermedia Systems', :CourseTitle => 'CSCE 610'},
			 {:course_name => 'Operating Systems and Applications', :CourseTitle => 'CSCE 611'},
			 {:course_name => 'Applied Networks and Distributed Processing', :CourseTitle => 'CSCE 612'},
			 {:course_name => 'Operating Systems', :CourseTitle => 'CSCE 613'},
			 {:course_name => 'Computer Architecture', :CourseTitle => 'CSCE 614'},
			 {:course_name => 'Co-Design of Embedded Systems', :CourseTitle => 'CSCE 617'},
			 {:course_name => 'Networks and Distributed Computing', :CourseTitle => 'CSCE 619'},
			 {:course_name => 'Computational Geometry', :CourseTitle => 'CSCE 620'},
			 {:course_name => 'Language, Library, and Program Design Using C++', :CourseTitle => 'CSCE 621'},
			 {:course_name => 'Generic Programming', :CourseTitle => 'CSCE 622'},
			 {:course_name => 'Sketch Recognition', :CourseTitle => 'CSCE 624'},
			 {:course_name => 'Parallel Algorithm Design and Analysis', :CourseTitle => 'CSCE 626'},
			 {:course_name => 'Theory of Computability', :CourseTitle => 'CSCE 627'},
			 {:course_name => 'Computational Biology', :CourseTitle => 'CSCE 628'},
			 {:course_name => 'Speech Processing', :CourseTitle => 'CSCE 630'},
			 {:course_name => 'Intelligent Agents', :CourseTitle => 'CSCE 631'},
			 {:course_name => 'Intelligent User Interfaces', :CourseTitle => 'CSCE 634'},
			 {:course_name => 'AI Robotics', :CourseTitle => 'CSCE 635'},
			 {:course_name => 'Neural Networks', :CourseTitle => 'CSCE 636'},
			 {:course_name => 'Complexity Theory', :CourseTitle => 'CSCE 637'},
			 {:course_name => 'Fuzzy Logic and Intelligent Systems', :CourseTitle => 'CSCE 639'},
			 {:course_name => 'Quantum Algorithms', :CourseTitle => 'CSCE 640'},
			 {:course_name => 'Computer Graphics', :CourseTitle => 'CSCE 641'},
			 {:course_name => 'Seminar in Intelligent Systems and Robotics', :CourseTitle => 'CSCE 643'},
			 {:course_name => 'Cortical Networks', :CourseTitle => 'CSCE 644'},
			 {:course_name => 'Geometric Modeling', :CourseTitle => 'CSCE 645'},
			 {:course_name => 'The Digital Image', :CourseTitle => 'CSCE 646'},
			 {:course_name => 'Image Synthesis', :CourseTitle => 'CSCE 647'},
			 {:course_name => 'Computer Aided Sculpting', :CourseTitle => 'CSCE 648'},
			 {:course_name => 'Physically-Based Modeling', :CourseTitle => 'CSCE 649'},
			 {:course_name => 'Computer Methods in Applied Sciences', :CourseTitle => 'CSCE 653'},
			 {:course_name => 'Supercomputing', :CourseTitle => 'CSCE 654'},
			 {:course_name => 'Human Centered Systems and Information', :CourseTitle => 'CSCE 655'},
			 {:course_name => 'Computers and New Media', :CourseTitle => 'CSCE 656'},
			 {:course_name => 'High Performance Computing for Earth Science and Petroleum Engineering', :CourseTitle => 'CSCE 657'},
			 {:course_name => 'Randomized Algorithms', :CourseTitle => 'CSCE 658'},
			 {:course_name => 'Parallel/Distributed Numerical Algorithms and Applications', :CourseTitle => 'CSCE 659'},
			 {:course_name => 'Computational Linear Algebra', :CourseTitle => 'CSCE 660'},
			 {:course_name => 'Integrated Systems Design Automation', :CourseTitle => 'CSCE 661'},
			 {:course_name => 'Distributed Processing Systems', :CourseTitle => 'CSCE 662'},
			 {:course_name => 'Real-Time Systems', :CourseTitle => 'CSCE 663'},
			 {:course_name => 'Wireless and Mobile Systems', :CourseTitle => 'CSCE 664'},
			 {:course_name => 'Advance Networking and Security', :CourseTitle => 'CSCE 665'},
			 {:course_name => 'Pattern Analysis', :CourseTitle => 'CSCE 666'},
			 {:course_name => 'Seminar in Human-Centered Computing and Information', :CourseTitle => 'CSCE 667'},
			 {:course_name => 'Distributed Algorithms and Systems', :CourseTitle => 'CSCE 668'},
			 {:course_name => 'Computational Optimization', :CourseTitle => 'CSCE 669'},
			 #{:course_name => 'Information Storage and Retrieval', :CourseTitle => 'CSCE 670'},
			 #{:course_name => 'Computer-Human Interaction', :CourseTitle => 'CSCE 671'},
			 #{:course_name => 'Computer Supported Collaborative Work', :CourseTitle => 'CSCE 672'},
			 #{:course_name => 'Digital Libraries', :CourseTitle => 'CSCE 675'},
			 #{:course_name => 'Testing and Diagnosis of Digital Systems', :CourseTitle => 'CSCE 680'},
			 #{:course_name => 'Seminar', :CourseTitle => 'CSCE 681'},
			 #{:course_name => 'Professional Internship', :CourseTitle => 'CSCE 684'},
			 #{:course_name => 'Directed Studies', :CourseTitle => 'CSCE 685'},
			 #{:course_name => 'Special Topics in..', :CourseTitle => 'CSCE 689'},
			]


timeslots = 	[{:time_slot => '8:00 am to 8:50 am', :day_combination_id => '3'},
				 {:time_slot => '9:10 am to 10:00 am', :day_combination_id => '3'},
				 {:time_slot => '10:20 am to 11:10 am', :day_combination_id => '3'},
				 {:time_slot => '11:30 am to 12:10 pm', :day_combination_id => '3'},
				 {:time_slot => '12:40 pm to 1:30 pm', :day_combination_id => '3'},
				 {:time_slot => '1:50 pm to 2:40 pm', :day_combination_id => '3'},
				 {:time_slot => '3:00 pm to 3:50 pm', :day_combination_id => '3'},
				 {:time_slot => '4:10 pm to 5:25 pm', :day_combination_id => '1'},
				 {:time_slot => '8:00 am to 9:15 am', :day_combination_id => '2'},
				 {:time_slot => '9:35 am to 10:50 am', :day_combination_id => '2'},
				 {:time_slot => '11:10 am to 12:25 pm', :day_combination_id => '2'},
				 {:time_slot => '12:45 pm to 2:00 pm', :day_combination_id => '2'},
				 {:time_slot => '2:20 pm to 3:35 pm', :day_combination_id => '2'},
				 {:time_slot => '3:55 pm to 5:10 pm', :day_combination_id => '2'},
			 
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
				 

facultypreferences = [{:faculty_course_id => '1', :preference1_id => '1', :preference3_id => '3', :semester_id => '1'},
					  {:faculty_course_id => '2', :preference1_id => '3', :preference2_id => '4', :preference3_id => '5', :semester_id => '1'},
					  {:faculty_course_id => '3', :preference1_id => '5', :preference2_id => '7', :preference3_id => '6', :semester_id => '1'},
				      {:faculty_course_id => '4', :preference1_id => '7', :preference3_id => '10', :semester_id => '1'},
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



