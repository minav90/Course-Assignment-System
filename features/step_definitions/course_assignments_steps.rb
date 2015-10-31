Given /the following buildings exist:$/ do |buildings_table|
    buildings_table.hashes.each do |building|
	Building.create!(building)
    end
end

Given /the following rooms exist:$/ do |rooms_table|
    rooms_table.hashes.each do |room|
	Room.create!(room)
    end
end

Given /the following day-combinations exist:$/ do |day_combination_table|
    day_combination_table.hashes.each do |day_combination|
	DayCombination.create!(day_combination)
    end
end

Given /the following time-slots exist:$/ do |time_slots_table|
    time_slots_table.hashes.each do |time_slot|
	TimeSlot.create!(time_slot)
    end
end	

When /I chose faculty "(.*)" from "(.*)"$/ do |faculty,field|
    select(faculty, :from => field)
    page.execute_script("$(#'#{field}').trigger()'change');")    
end 
