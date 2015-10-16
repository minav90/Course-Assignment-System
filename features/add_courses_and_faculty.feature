Feature: add a page to assign courses to faculty members

 As admin of the Course Assignment System
 So that faculty can view courses assigned and choose their preferences
 I want to assign courses to faculty members

 Background: faculties and courses have been added to the database

 Given the following faculties exist:
 | faculty_id |
 ||
 | 1 |
 | 2 |
 | 3 |

 And the following courses exist:
 | course_id |
 ||    
 | 1 |
 | 2 |
 | 3 |

 And I am on the Course and Faculty page

 Scenario: assign courses to faculty
   When I select "1" from "faculty_id"
   And I select "1" from "courses[course1_id]"
   And I select "2" from "courses[course2_id]"
   And I press "Submit"
   Then select box "courses_course1_id" is selected with "1"
   And select box "courses_course2_id" is selected with "2"

 Scenario: load already assigned courses for selected faculty
   Given faculty "2" is assigned following courses: 1,2,3
   When I select "2" from "faculty_id"
   Then select box "courses_course1_id" is selected with "1"
   And select box "courses_course2_id" is selected with "2"
   And select box "courses_course3_id" is selected with "3"
