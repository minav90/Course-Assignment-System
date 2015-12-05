@javascript
Feature: add a page to assign courses to faculty members

 As admin of the Course Assignment System
 So that faculty can view courses assigned and choose their preferences
 I want to assign courses to faculty members

 Background: faculties and courses have been added to the database

   Given the following semesters exist:
   | SemesterTitle |
   | Fall 2015 |

   And the following faculties exist:
   | faculty_name |
   | faculty_1 |
   | Chen Jianer |
   | Ioerger Thomas |

   And the following courses exist:
   | course_name | CourseTitle |
   | CSCE 606 | test1 |
   | CSCE/ECEN 680 | test2 |
   | CSCE 629 | test3 |
   | CSCE 608 | test4 |
   | CSCE 625 | test5 |

   And the following faculty-course mappings exist:
   | faculty_id | course1_id | course2_id | course3_id | semester_id |
   | 2          | 3          | 4          |            | 1 	   |
   | 1 	      | 1	   | 2	        |	     | 1 	   |

   And I am on the home page
   When I choose semester "Fall 2015" and follow "Assign Faculty & Courses"
   Then I am on the Course and Faculty page


 Scenario: selecting faculty
   When I choose faculty "1" from "faculty_id"
   Then I should see "Assign Courses"
   And I should see "faculty_1" 
 
 Scenario: showing courses for selected faculty
   When I select "Chen Jianer" from "faculty_id"
   And I press "Select"
   Then I should see "Chen Jianer"
   And "courses_course1_id" is selected with "CSCE 629"
   And "courses_course2_id" is selected with "CSCE 608"
   And "courses_course3_id" is selected with ""

 Scenario: assigning courses to faculty
   When I select "Ioerger Thomas" from "faculty_id"
   And I press "Select"
   Then I should see "Ioerger Thomas"
   When I select "CSCE 625" from "courses_course1_id"
   And I press "Submit"
   Then I am on the Course and Faculty page
   And I should see "CSCE 625"

