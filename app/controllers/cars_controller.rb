class CarsController < ApplicationController
  skip_before_action :authorize_request, only: %i[index show]
  before_action :set_car, only: %i[show edit update destroy]

  def index
    @cars = Car.all

    render json: @cars, each_serializer: CarSerializer
  end

  def new; end

  def edit; end

  def show
    render json: @car, serializer: CarDetailsSerializer
  end

  def create
    @car = Car.new(car_params)

    if @car.save!
      response = { message: Message.car_created }
      json_response(response, :created)
    else
      response = { message: Message.something_went_wrong }
      json_response(response, :unprocessable_entity)
    end
  end

  def update
    if @car.update_attributes(car_params)
      response = { message: Message.car_updated }
      json_response(response)
    else
      response = { message: Message.something_went_wrong }
      json_response(response, :unprocessable_entity)
    end
  end

  def destroy
    @car.destroy
    response = { message: Message.car_destroyed }
    json_response(response)
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.permit(:manufacturer_id, :category_id, :model, :color, :status, :price, :description, :year, :image)
  end

  def admin_user
    redirect_to(root_url) if current_user.admin
  end
end
