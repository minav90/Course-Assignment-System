require 'rails_helper'

RSpec.describe Semester, type: :model do
    describe 'creating semester' do
	it 'should create a semester and default classrooms' do
		Semester.stub(:create!).and_return(double(:id => '1'))
		ClassroomTiming.stub(:create!)
		Semester.create_semester("test")
	end
    end
end
