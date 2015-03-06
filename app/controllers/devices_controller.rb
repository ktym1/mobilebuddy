class DevicesController < ApplicationController
  def index
   @devices = Device.all
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
      @summaries = Summary.current(Date.yesterday, params[:dev]) 
      hash = @summaries.group_by {|s| s.retailer_id}
      recent = hash.map {|k,v| hash[k].last}
      @summaries = recent.group_by { |d| d.contract }
    end
      respond_to do |format|
        format.js
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
