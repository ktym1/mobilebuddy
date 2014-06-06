class MetadatasController < ApplicationController
   
    def index
    	@metadatas = Metadata.all
    end

	def new
		@metadata = Metadata.new
	end

	def create
		@metadata = Metadata.new(metadata_params)
		if @metadata.save
			redirect_to metadatas_url
		else
			render :new
		end

	end
 
    private
	def metadata_params
		params.require(:metadata).permit(:detail, :device_id, :retailer_id)
	end
end
