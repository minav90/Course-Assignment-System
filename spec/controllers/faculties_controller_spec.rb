require 'rails_helper'

describe FacultiesController do
    describe 'assigning courses to faculty' do
	it 'should call the model method to get the list of faculties' do
 		Faculty.should_receive(:all)
		post :assign_courses
	end
   end
end
