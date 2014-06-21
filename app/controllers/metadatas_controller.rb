class MetadatasController < ApplicationController
	def index
    	@metadatas = Metadata.all
    end

	def new
		@metadata  = Metadata.new
		load_select_options
	end

	def create
		@metadata = metadata_params
		if @metadata.save
			redirect_to metadatas_url
		else
			render :new
		end
	end

	def edit
		@metadata = Metadata.find(params[:id])
		load_select_options
	end

	def update
		@metadata = Metadata.find(params[:id])

		if @metadata.update_attribute(:detail, params[:detail])
			redirect_to metadatas_url
		else
			render :edit
		end	
	end

    
    private 
    def load_select_options
	    @retailers = Retailer.all
		@devices   = Device.where(active: true)
    end

 
    private
	def metadata_params
		Metadata.new(detail: params[:detail], device_id: params[:device], retailer_id: params[:retailer])
	end
end
