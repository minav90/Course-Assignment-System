$("#course_ctr").empty().append("<%= escape_javascript(render(:partial => @faculty_course)) %>")
