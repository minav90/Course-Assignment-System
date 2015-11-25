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

 And the following courses exist:
 | course_name |
 | course1 |
 | course2 |
 | course3 |

 And the following faculty-course mappings exist:
 | faculty_id | course1_id | course2_id | course3_id |
 | 2          | 1          | 2          | 3          |

 And the following semesters exist:
 | SemesterTitle |
 | Fall 2015 |

 And I am on the home page

 @javascript
 Scenario: selecting faculty
   When I choose semester "Fall 2015"
   And I follow "Assign Faculty & Courses"
   Then I am on the Course and Faculty page
   And I should see "Faculty and Courses"
   When I select "A" from "faculty_id"
   And I press "Select"
   Then I should be on the Assign Courses page for "A"
   And I should see "A" 
 
 Scenario: showing courses for selected faculty
   When I select "1" from "sessionId"
   And I follow "Assign Faculty & Courses"
   Then I am on the Course and Faculty page
   When I select "B" from "faculty_id"
   And I press "Select"
   Then I should be on the Assign Courses page for "B"
   And "courses_course1_id" is selected with "course1"
   And "courses_course2_id" is selected with "course2"
   And "courses_course3_id" is selected with "course3"
