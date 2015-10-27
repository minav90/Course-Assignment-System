require 'rails_helper'

describe FacultyCourseRoomTimingsController do
    describe 'showing faculties' do
	it 'should call the model method to get all faculties' do
		Faculty.should_receive(:order)
		post :index
	end
	it 'should make the faculties available to the index template for rendering' do
		fake_faculties = [Faculty.new,Faculty.new]
		Faculty.stub(:all).and_return(fake_faculties)
		Faculty.stub(:order).and_return(fake_faculties)
		post :index
		assigns(:faculties).should == fake_faculties
		response.should render_template(:index)
	end
    end
end
