class DevicesController < ApplicationController
  def index
    @devices = if params[:search]
     Device.where("name like ? or model like ?", "%#{params[:search]}%", "%#{params[:search]}%") 
    else
      Device.all
    end

    respond_to do |format|
      format.html
      format.js
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
      @summaries = Summary.where(device_id: params[:dev]).group(:contract_id,:retailer_id)
      respond_to do |format|
        format.html
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

  def device_params
    params.require(:device).permit(:name, :description, :model, :image)
  end

end
