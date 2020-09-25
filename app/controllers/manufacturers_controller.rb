class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]
  
  def index
    @makers = Manufacturer.all
    # respond_to do |f|
    #   f.html
    #   # f.json { render :json => @manufacturers }
    #   f.json { json_response(@manufacturer) }
    # end
    # @makers.each do |i|
    #   if i.present?
    #     image_url = { :image => (url_for i.image) }
    #     i.attributes.merge(image_url)
    #   end
    # end
    # response = {
    #   manufacturers: []
    # }

    # @makers.each do |m|
    #   if m.present?
    #     serializer = ManufacturerSerializer.new(manufacturer: m)
    #     (response[:manufacturers] ||=[]) << (serializer.serialize_new_manufacturer())
    #   end
    # end
  
    # render json: response, status: 200
    json_response(@makers)
  end

  def new
    @maker = Manufacturer.new
  end

  def edit
    # respond_to do |f|
    #   f.html
    #   # f.json { render json: @manufacturer }
    #   f.json { json_response(@manufacturer) }
    # end
    json_response(@maker)
  end

  def show 
    # respond_to do |f|
    #   f.html
    #   # f.json { render json: @manufacturer }
    #   f.json { json_response(@manufacturer) }
    # end
    json_response(@maker)
  end

  def create
    @maker = Manufacturer.new(manufacturer_params)
    # if params[:file]
    #   @maker.image.attach(params[:file])
    #   @maker.logo.attach(params[:file])
    #   image = url_for(@maker.image)
    #   logo = url_for(@maker.logo)
    # end
    # if @maker.save
    respond_to_create()
    #   response = { message: Message.manufacturer_created }
    #   json_response(response, :created)
    # else
    #   response = { message: Message.something_went_wrong }
    #   json_response(response, :unprocessable_entity)
    # end
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
      # json = params.require(maker:)
      # { manufacturer: JSON.parse(json).permit(:manufacturer, :about, :logo, :images) }
      params.permit(:manufacturer, :about, :image, :logo)
    end

    def respond_to_create
      if @maker.valid?
        manufacturer_serializer = ManufacturerSerializer.new(manufacturers: @maker)
        response = manufacturer_serializer.serialize_new_manufacturer()
        render json: response, status: 200
      else
        render json: { errors: @maker.errors }, status: 400
      end
    end
end