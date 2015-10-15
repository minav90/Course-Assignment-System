Feature: add a page to assign courses to faculty members

 As admin of the Course Assignment System
 So that faculty can view courses assigned and choose their preferences
 I want to assign courses to faculty members

 Background: faculties and courses have been added to the database

 Given the following faculties exist:
 | faculty_name |
 ||
 | A |
 | B |
 | C |

 And the following courses exist:
 | course_name |
 ||    
 | course1 |
 | course2 |
 | course3 |

 And I am on the Course and Faculty page

 Scenario: assign courses to faculty
   When I select "A" from "faculty_name"
   And I select "course1" from "course_num1"
   And I select "course2" from "course_num2"
   And I press "Submit"
   Then select box "course1_num1" is selected with "course1"
   And select box "course_num2" is selected with "course2"

 Scenario: load already assigned courses for selected faculty
   Given faculty "B" is assigned following courses: course1,course2,course3
   When I select "B" from "faculty_name"
   Then select box "course_num1" is selected with "course1"
   And select box "course_num2" is selected with "course2"
   And select box "course_num3" is selected with "course3"
