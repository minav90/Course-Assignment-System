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

When /I select faculty "(.*)" from "(.*)"$/ do |faculty,field|
    select(faculty, :from => field)
    page.execute_script("$(#'#{field}').trigger('change');")    
end

When /I assign course "(.*)" with: (.*)$/ do |course_id,list|
    list_arr = list.split(",")
    if list_arr == []
	page.execute_script("$(#building_select_#{course_id}).prop('selectedIndex',0);")
	list_arr[0] = ""
	list_arr[1] = ""
	list_arr[2] = ""
	list_arr[3] = ""
    else
    	step "I select \"" + list_arr[0] + "\" from \"building_select_" + course_id + "\""
    	step "I select \"" + list_arr[1] + "\" from \"room_select_" + course_id + "\""
    	step "I select \"" + list_arr[2] + "\" from \"day_combination_select_" + course_id + "\""
    	step "I select \"" + list_arr[3] + "\" from \"time_slot_select_" + course_id + "\""
    	step "I press \"submit_" + course_id + "\""
    end
end
