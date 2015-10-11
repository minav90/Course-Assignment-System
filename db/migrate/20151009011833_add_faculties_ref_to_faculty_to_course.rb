class AddFacultiesRefToFacultyToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :faculties, index: true, foreign_key: true
  end
end
