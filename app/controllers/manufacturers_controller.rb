class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: %i[show edit update destroy]

  def index
    @manufacturers = Manufacturer.all

    # response = {
    #   manufacturers: []
    # }

    # @makers.each do |m|
    #   if m.present?
    #     serializer = ManufacturerSerializer.new(m)
    #     (response[:manufacturers] ||= []) << serializer.serialize
    #   end
    # end

    # json_response(@makers)
  end

  def new
  end

  def edit
  end

  def show
    # serializer = ManufacturerSerializer.new(@maker)
    # json_response(@manufacturer)
    @manufacturer = Manufacturer.find(params[:id])
    # json_response(@manufacturer)
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      # manufacturer_serializer = ManufacturerSerializer.new(@maker)
      # response = manufacturer_serializer.serialize
      json_response(@manufacturer, :created)
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
    params.permit(:manufacturer, :about, :image, :logo)
  end

  def respond_to_create
    
  end
end
