class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]
  
  def index
    @makers = Manufacturer.all
    
    response = {
      manufacturers: []
    }

    @makers.each do |m|
      if m.present?
        serializer = ManufacturerSerializer.new(m)
        (response[:manufacturers] ||=[]) << (serializer.serialize())
      end
    end
   
    json_response(response)
  end

  def new
    @maker = Manufacturer.new
  end

  def edit
    json_response(@maker)
  end

  def show
    serializer = ManufacturerSerializer.new(@maker)
    json_response(serializer.serialize())
  end

  def create
    @maker = Manufacturer.new(manufacturer_params)
    respond_to_create()
  end

  def update
    if @maker.update_attributes(manufacturer_params)
     
      response = { message: Message.manufacturer_updated }
      json_response(response)
    else
     
      response = { message: Message.something_went_wrong }
      json_response(response, :unprocessable_entity)
    end
  end

  def destroy
    @maker.destroy
    
    response = { message: Message.manufacturer_destroyed }
    json_response(response)
  end

  private
    def set_manufacturer
      @maker = Manufacturer.find(params[:id])
    end

    def manufacturer_params
      params.permit(:manufacturer, :about, :image, :logo)
    end

    def respond_to_create
      if @maker.save
        manufacturer_serializer = ManufacturerSerializer.new(@maker)
        response = manufacturer_serializer.serialize()
        json_response(response, :created)
      else
        response = { message: Message.something_went_wrong }
        json_response(response, :unprocessable_entity)
      end
    end
end