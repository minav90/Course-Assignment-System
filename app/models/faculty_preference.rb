class FacultyPreference < ActiveRecord::Base
	belongs_to :faculty_course
	belongs_to :preference1, class_name: "Preference"
	belongs_to :preference2, class_name: "Preference"
	belongs_to :preference3, class_name: "Preference"
	belongs_to :semester
	accepts_nested_attributes_for :preference1, :preference2, :preference3
end
