class PrefSummaryController < ApplicationController
  def index
  	@facultycourse = FacultyCourse.all
  end
end
