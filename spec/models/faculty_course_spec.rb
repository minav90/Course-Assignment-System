require 'rails_helper'

RSpec.describe FacultyCourse, type: :model do
    describe 'generating CSV' do
	it 'should generate a csv file for faculty preferences' do
		CSV.stub(:generate).and_return([[],[]])
		FacultyCourse.to_csv
	end
    end
end
