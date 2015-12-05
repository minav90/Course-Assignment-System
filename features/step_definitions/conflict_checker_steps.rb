Given /the following faculty to course mappings exist:/ do |faculty_courses_table|
    faculty_courses_table.hashes.each do |faculty_course|
	FacultyCourse.create!(faculty_course)
    end
end

Given /the following preferences exist:/ do |preferences_table|
    preferences_table.hashes.each do |preference|
	Preference.create!(preference)
    end
end

Given /the following faculty_member-preference mappings exist:/ do |faculty_preferences_table|
    faculty_preferences_table.hashes.each do |faculty_preference|
	FacultyPreference.create!(faculty_preference)
    end
end

Given /the following time-ranges exist:/ do |time_range_table|
    time_range_table.hashes.each do |time_range|
	TimeRange.create!(time_range)
    end
end

Then(/^I should see "(.*?)" and "(.*?)"$/) do |arg1, arg2|
	page.should have_content(arg1)
end

