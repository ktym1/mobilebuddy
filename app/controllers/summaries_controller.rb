class SummariesController < ApplicationController

def index
	@summaries = if params[:search]
			Summary.joins(:device).where("devices.name like ?", "%#{params[:search]}%") 
		else
			Summary.all
		end

		respond_to do |format|
			format.html
			format.js
		end
end

	
def show
	@summary = Summary.find(params[:id])
end

end