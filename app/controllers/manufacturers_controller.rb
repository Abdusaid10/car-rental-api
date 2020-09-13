class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]
  
  def index
    @manufacturers = Manufacturer.all
    # respond_to do |f|
    #   f.html
    #   # f.json { render :json => @manufacturers }
    #   f.json { json_response(@manufacturer) }
    # end
    json_response(@manufacturers)
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def edit
    # respond_to do |f|
    #   f.html
    #   # f.json { render json: @manufacturer }
    #   f.json { json_response(@manufacturer) }
    # end
    json_response(@manufacturer)
  end

  def show 
    # respond_to do |f|
    #   f.html
    #   # f.json { render json: @manufacturer }
    #   f.json { json_response(@manufacturer) }
    # end
    json_response(@manufacturer)
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
   
    if @manufacturer.save
     
      response = { message: Message.manufacturer_created }
      json_response(response, :created)
    else
      response = { message: Message.something_went_wrong }
      json_response(response, :unprocessable_entity)
    end
  end

  def update
    if @manufacturer.update_attributes(manufacturer_params)
     
      response = { message: Message.manufacturer_updated }
      json_response(response)
    else
     
      response = { message: Message.something_went_wrong }
      json_response(response, :unprocessable_entity)
    end
  end

  def destroy
    @manufacturer.destroy
    
    response = { message: Message.manufacturer_destroyed }
    json_response(response)
  end

  private
    def set_manufacturer
      @manufacturer = Manufacturer.find(params[:id])
    end

    def manufacturer_params
      params.require(:manufacturer).permit(:manufacturer, :about, :logo, :img, :images)
    end
end