Given /the following faculties exist:/ do |faculties_table|
    faculties_table.hashes.each do |faculty|
	# each returned element will be a hash whose keys will be the table header
	# arrange to add the faculty to the databse here
	Faculty.create!(faculty)
    end
end	

Given /the following courses exist:/ do |courses_table|
    courses_table.hashes.each do |course|
	# each returned element will be a hash whose keys will be the table header
	# arrange to add the course ot the databse here
	Course.create!(course)
    end
end

Given /the following faculty-course mappings exist:/ do |faculty_courses_table|
    faculty_courses_table.hashes.each do |faculty_course|
	FacultyCourse.create!(faculty_course)
    end
end

Given /the following semesters exist:/ do |semester_table|
    semester_table.hashes.each do |semester|
	Semester.create(semester)
    end
end

Then /"(.*)" is selected with "(.*)"$/ do |select_box,value|
	page.should have_select(select_box, selected: value)
end

When /I choose semester "(.*)" and follow "(.*)"$/ do |semester,link|
	step "I select \"#{semester}\" from \"sessionId\""
	page.execute_script("$('#sessionId').trigger('onchange')")
	step "I follow \"#{link}\""
end

When /I choose faculty "(.*)" from "(.*)"$/ do |name,field|
	step "I select \"#{name}\" from \"#{field}\""
	step "I press \"Select\""	
end
