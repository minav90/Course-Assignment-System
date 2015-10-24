class AddCourseTitleColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :CourseTitle, :string
  end
end
