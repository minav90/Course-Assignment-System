require 'rails_helper'

RSpec.describe FacultyCourse, type: :model do
    describe 'generating CSV' do
	it 'should generate a csv file for faculty preferences' do
		CSV.stub(:generate).and_return(CSV.new("1,2,3"))
		FacultyCourse.to_csv
	end
    end
end
