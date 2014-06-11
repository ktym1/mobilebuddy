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

  def summary
    @summaries = Summary.where(device_id: params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

	
def show
	@summary = Summary.find(params[:id])
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

private

def summary_params
	params.require(:summary).permit(:price, :promotion_link, :contract_id, :device_id, :retailer, :gift_card)
end

end