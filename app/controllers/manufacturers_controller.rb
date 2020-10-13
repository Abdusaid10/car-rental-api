class ManufacturersController < ApplicationController
  skip_before_action :authorize_request, only: %i[index show]
  before_action :set_manufacturer, only: %i[show edit update destroy]
 
  def index
    @manufacturers = Manufacturer.all
    render json: @manufacturers, each_serializer: ManufacturerSerializer
  end

  def new; end

  def edit; end

  def show
    render json: @manufacturer, serializer: ManufacturerDetailsSerializer
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
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
end
