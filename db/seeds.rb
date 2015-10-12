# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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

buildings.each do |building|
  Building.create!(building)
end

rooms = [{:Buildings_id => '1', :room_name => '124'},
    	  {:Buildings_id => '2', :room_name => '108'},
    	  { :Buildings_id => '3', :room_name => '303'},
  	       ]

rooms.each do |room|
  Room.create!(room)
end

slots = [{:time_slot => '8.00 - 10.00'},
    	  { :time_slot => '10.00 - 12.00'},
    	  { :time_slot => '12.00 - 14.00'},
  	       ]

slots.each do |slot|
  TimeSlot.create!(slot)
end

classes = [{:rooms_id => '1', :timeslots_id => '1'},
    	  {:rooms_id => '2', :timeslots_id => '2'},
    	  {:rooms_id => '3', :timeslots_id => '3'},
  	       ]

classes.each do |classroom|
  ClassroomTiming.create!(classroom)
end