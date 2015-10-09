Feature: add a page to assign courses to faculty members

 As admin of the Course Assignment System
 So that faculty can view courses assigned and choose their preferences
 I want to assign courses to faculty members

 Background: faculties and courses have been added to the database

 Given the following faculties exist:
 | faculty_name |
 | A |
 | B |
 | C |

 And the following courses exist
 | course_name |
 | course1 |
 | course2 |
 | course3 |

 And I am on the Course and Faculty page

 Scenario: assign courses to faculty
   When I select "Dr. John Keyser" from "Faculties"
   And I select "course1" from "Course_1"
   And I select "course2" from "Course_2
   And I press "Submit"
   Then select box "Course_1" is selected with "course1"
   And select box "Course_2" is selected with "course2"

 Scenario: load already assigned courses for selected faculty
   When I select "Dr. John Keyser" from "Faculties"
   Then select box "Course_1" is selected with "course1"
   And select box "Course_2" is selected with "course2"
