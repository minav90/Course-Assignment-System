@javascript
Feature: add a page to check conflicts among faculty preferences

 As admin of the Course Assignment System
 So that I can assign courses to faculty
 I want to view if faculty preferences have conflicts

 Background: faculties, courses, classrooms and preferences have been added to the database

 Given the following semesters exist:
   | SemesterTitle |
   | Fall 2015 |

 Given the following faculties exist:
 | faculty_name |
 | A |
 | B |

 And the following courses exist:
 | course_name |
 | course1 |
 | course2 |

 And the following faculty to course mappings exist:
 | faculty_id | course1_id | course2_id | course3_id |
 | 1          | 1          |            |            |
 | 2          | 2          |            |            |

 And the following buildings exist:
 | building_name |
 | HRBB |
 | CHEN |

 And the following time-ranges exist:
 | t_range | t_slots | day_combination_id |
 | Morning | 1       | 1                  |

 And the following time-slots exist:
 | time_slot |
 | 8:00 am to 8:50 am |
 | 9:35 am to 10:50 am |
 | 12:45 pm to 2:00 pm |
 | 5:30 pm to 6:45 pm |

 And the following day-combinations exist:
 | day_combination |
 | MW |
 | TR |

 And the following preferences exist:
 | day_combination_id | time_slot_id | building_id |
 | 2                  | 2            | 1           |
 
 And the following faculty_member-preference mappings exist:
 | faculty_course_id | preference1_id | preference2_id | preference3_id |
 | 1	             | 1	      |     	       |	        |
 | 2	             |		      |	               | 1	        |

 And I am on the home page
 When I choose semester "Fall 2015" and follow "Conflict Checker"
 Then I am on the Conflict Checker page

 Scenario: selecting Day-Combo and Time-Slot
   When I select "TR" from "day_combination_select"
   And I select "Morning" from "time_range_select"
   And I press "Submit"
   Then I should be on the Conflict Checker page

 Scenario: selecting Day-Combo, Time-Slot and Building
   When I select "TR" from "day_combination_select"
   And I select "Morning" from "time_range_select"
   And I select "HRBB" from "building_select"
   And I press "Submit"
   Then I should be on the Conflict Checker page
