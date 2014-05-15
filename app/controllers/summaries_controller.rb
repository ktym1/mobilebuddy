class SummariesController < ApplicationController

def index
	if params[:search]
		@summaries = Summary.search(params[:search]).order("created_at DESC")
	else
		@summaries = Summary.all
	end
end

def show
	@summary = Summary.find(params[:id])
end

def new
	@summary = Summary.new
end

def create
	@summary = Summary.new(summary_params)
	respond_to do |format|
		if @review.save
			format.html {redirect_to summary_path(@summary.id), notice:"Summary "}
		end
	end
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
