Feature: Add a page to assign classroom and time for each of the faculty courses

 As an admin of the Course Assignment System
 So that I can make my final decisions available to the faculty
 I want to  enter my decision regarding the classroom and time for faculty courses

 Background: faculties,courses,classrooms,day-combinations and time-slots have been added to the database

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

 And I am on the Assign Room and Timings page

 Scenario: showing assigned courses for selected faculty
   When I select "B" from "faculty_id"
   And I press "Select"
   Then I should see "course1"
   And I should see "course2"
   And I should see "course3"
