class Semester < ActiveRecord::Base
	has_many :classroom_timings, :dependent => :destroy
	has_many :course_assignments, :dependent => :destroy
	has_many :faculty_courses, :dependent => :destroy
	has_many :faculty_preferences, :dependent => :destroy
	has_many :preferences, :dependent => :destroy

    @@classroomtimings = [{:room_id => '1', :time_slot_id => '1', :day_combination_id => '3'},
                                        {:room_id => '1', :time_slot_id => '2', :day_combination_id => '3'},
                                        {:room_id => '1', :time_slot_id => '3', :day_combination_id => '3'},
                                    {:room_id => '1', :time_slot_id => '4', :day_combination_id => '3'},
                                        {:room_id => '1', :time_slot_id => '5', :day_combination_id => '3'},
                                        {:room_id => '1', :time_slot_id => '6', :day_combination_id => '3'},
                                        {:room_id => '1', :time_slot_id => '7', :day_combination_id => '3'},
                                        {:room_id => '1', :time_slot_id => '8', :day_combination_id => '1'},
                                        {:room_id => '1', :time_slot_id => '9', :day_combination_id => '2'},
                                        {:room_id => '1', :time_slot_id => '10', :day_combination_id => '2'},
                                        {:room_id => '1', :time_slot_id => '11', :day_combination_id => '2'},
                                        {:room_id => '1', :time_slot_id => '12', :day_combination_id => '2'},
                                        {:room_id => '1', :time_slot_id => '13', :day_combination_id => '2'},
                                        {:room_id => '1', :time_slot_id => '14', :day_combination_id => '2'},
                                        {:room_id => '2', :time_slot_id => '1', :day_combination_id => '3'},
                                        {:room_id => '2', :time_slot_id => '2', :day_combination_id => '3'},
                                        {:room_id => '2', :time_slot_id => '3', :day_combination_id => '3'},
                                    {:room_id => '2', :time_slot_id => '4', :day_combination_id => '3'},
                                        {:room_id => '2', :time_slot_id => '5', :day_combination_id => '3'},
                                        {:room_id => '2', :time_slot_id => '6', :day_combination_id => '3'},
                                        {:room_id => '2', :time_slot_id => '7', :day_combination_id => '3'},
                                        {:room_id => '2', :time_slot_id => '8', :day_combination_id => '1'},
                                        {:room_id => '2', :time_slot_id => '9', :day_combination_id => '2'},
                                        {:room_id => '2', :time_slot_id => '10', :day_combination_id => '2'},
                                        {:room_id => '2', :time_slot_id => '11', :day_combination_id => '2'},
                                        {:room_id => '2', :time_slot_id => '12', :day_combination_id => '2'},
                                        {:room_id => '2', :time_slot_id => '13', :day_combination_id => '2'},
                                        {:room_id => '2', :time_slot_id => '14', :day_combination_id => '2'},
                                        {:room_id => '3', :time_slot_id => '1', :day_combination_id => '3'},
                                        {:room_id => '3', :time_slot_id => '2', :day_combination_id => '3'},
                                        {:room_id => '3', :time_slot_id => '3', :day_combination_id => '3'},
                                    {:room_id => '3', :time_slot_id => '4', :day_combination_id => '3'},
                                        {:room_id => '3', :time_slot_id => '5', :day_combination_id => '3'},
                                        {:room_id => '3', :time_slot_id => '6', :day_combination_id => '3'},
                                        {:room_id => '3', :time_slot_id => '7', :day_combination_id => '3'},
                                        {:room_id => '3', :time_slot_id => '8', :day_combination_id => '1'},
                                        {:room_id => '3', :time_slot_id => '9', :day_combination_id => '2'},
                                        {:room_id => '3', :time_slot_id => '10', :day_combination_id => '2'},
                                        {:room_id => '3', :time_slot_id => '11', :day_combination_id => '2'},
                                        {:room_id => '3', :time_slot_id => '12', :day_combination_id => '2'},
                                        {:room_id => '3', :time_slot_id => '13', :day_combination_id => '2'},
                                        {:room_id => '3', :time_slot_id => '14', :day_combination_id => '2'},

                                ]

    def self.create_semester(name)
	semester = Semester.create!(SemesterTitle: name)
	@@classroomtimings.each do |cts|
		cts[:semester_id] = semester.id.to_s
  		ClassroomTiming.create!(cts)
	end
    end
end
