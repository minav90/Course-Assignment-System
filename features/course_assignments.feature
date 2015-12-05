@javascript
Feature: Add a page to assign classroom and time for each of the faculty courses

 As an admin of the Course Assignment System
 So that I can make my final decisions available to the faculty
 I want to  enter my decision regarding the classroom and time for faculty courses

 Background: faculties,courses,classrooms,day-combinations and time-slots have been added to the database

 Given the following semesters exist:
 | SemesterTitle |
 | Fall 2015 |
 
 And the following faculties exist:
 | faculty_name |
 | Walker Duncan |
 | Chen Jianer |
 | Ioerger Thomas |

 And the following courses exist:
 | course_name |
 | CSCE 606 |
 | CSCE/ECEN 680 |
 | CSCE 629 |
 | CSCE 608 |
 | CSCE 625 |

 And the following faculty-course mappings exist:
 | faculty_id | course1_id | course2_id | course3_id | semester_id |
 | 2          | 3          | 4          |            | 1           |
 | 1          | 1          | 2          |            | 1           |

 And the following buildings exist:
 | building_name |
 | HRBB |
 | CHEN |

 And the following rooms exist:
 | room_name | building_id |
 | 124 | 1 |
 | 126 | 2 |

 And the following day-combinations exist:
 | day_combination |
 | MW |
 | MWF |

 And the following time-slots exist:
 | time_slot |
 | 8:00 am to 8:50 am |
 | 9:35 am to 10:50 am |
 | 12:45 pm to 2:00 pm |
 | 5:30 pm to 6:45 pm |

 And I am on the home page
 When I choose semester "Fall 2015" and follow "Course Assignments"
 Then I am on the Course Assignments page
 And I should see "Assign Room and Timings for Faculty Courses"

@selenium
 Scenario: assigning room and timings for courses
   When I select "Walker Duncan" from "faculty_id"

