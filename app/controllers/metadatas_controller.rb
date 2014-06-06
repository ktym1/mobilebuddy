class MetadatasController < ApplicationController
	def index
    	@metadatas = Metadata.all
    end

	def new
		@metadata  = Metadata.new
		@retailers = Retailer.all
		@devices   = Device.where(active: true)
	end

	def create
		@metadata = metadata_params
		if @metadata.save
			redirect_to metadatas_url
		else
			render :new
		end
	end
 
    private
	def metadata_params
		Metadata.new(detail: params[:detail], device_id: params[:device], retailer_id: params[:retailer])
	end
end
