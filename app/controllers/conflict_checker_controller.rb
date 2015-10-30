class ConflictCheckerController < ApplicationController
  def index
    # @preferences = Preference.all #building_id, day_combination_id, time_slot_id, semester_id
    # @faculty_preferences = FacultyPreference.all #faculty_course_id, preference1_id, preference2_id, preference3_id, semester_id
    @conflicts = FacultyPreference.find_by_sql("SELECT *, COUNT(*) FROM faculty_preferences GROUP BY preference1_id HAVING COUNT(*) > 1")
  end
end

