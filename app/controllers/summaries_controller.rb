class SummariesController < ApplicationController

def index
	@summaries = Summaries.all
end

def show
	@summary = Summary.find(params[:id])
end

def new
	@summary = Summary.new
end

def create
	@summary = Summary.new(summary_params)
end

def edit
	@summary = Summary.find(params[:id])
end


def update
	@summary = Summary.find(params[:id])

	if @summary.update_attributes(summary_params)
		redirect_to summary_path(@summary)
	else
		render :edit
	end
end

def destroy
	@summary = Summary.find(params[:id])
	@summary.destroy
	redirect_to summaries_path
end

	private

	def summary_params
		params.require(:summary).permit(:price, :promotion_link, :contract_id, :device_id, :retailer_id)
	end


end
