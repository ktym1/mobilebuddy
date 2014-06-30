class DevicesController < ApplicationController
  def index
   @devices = Device.where(active: true)
    respond_to do |format|
      format.html
      format.js
      format.json
    end

  end

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
      if @device.save
        add_group_mailchimp
        redirect_to devices_url
      else
        render :new
      end
  end

  def edit
    @device = Device.find(params[:id])
  end

  def search
    if params[:dev]
      @summaries = Summary.includes(:device, :retailer).where(device_id: params[:dev]).group(:contract_id,:retailer_id)
      @summaries = @summaries.group_by { |d| d.contract }
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    @device = Device.find(params[:id])

    if @device.update_attributes(device_params)
      redirect_to device_path(@device)
    else
      render :edit
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to devices_path
  end

  private 
  def add_group_mailchimp
    @mailchimp.lists.interest_group_add('6ae858fa9a',@device.name+@device.model)
  end


  private
  def device_params
    params.require(:device).permit(:name, :description, :model, :image, :remote_image_url)
  end

end
