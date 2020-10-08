class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  # before_action :admin_user, only: [:create, :edit, :update, :destroy]

  def index
    @cars = Car.all
    @manufacturer = Manufacturer.find_by(id: car.manufacturer_id)
    category = Category.find_by(id: car.category_id)
    @categories =
      response = {
        cars: []
      }
    @cars.each do |car|
      manufacturer = Manufacturer.find_by(id: car.manufacturer_id)
      category = Category.find_by(id: car.category_id)
      if car.present?
        serializer = CarSerializer.new(car, manufacturer, category)
        (response[:cars] ||= []) << serializer.serialize_car_cat_maker
      end
    end
    # json_response(@cars)
  end

  def new
    # @car = Car.new
  end

  def edit
    # json_response(@car)
  end

  def show
    @car = Car.find(params[:id])
    @car_maker = Manufacturer.find_by(id: @car.manufacturer_id)
    @car_category = Category.find_by(id: @car.category_id)

    # serializeMaker = ManufacturerSerializer.new(@carMaker)
    # serializedMaker= serializeMaker.serialize_makers_for_cars()

    # serialize_car = CarSerializer.new(@car, @car_maker, @car_category)
    # serialized_car = serialize_car.serialize_car_for_show
    # serialized_car.merge!({ category: @car_category })
    # serialized_car.merge!({ manufacturer: serializedMaker })

    # json_response(serialized_car)
  end

  def create
    @car = Car.new(car_params)

    if @car.save
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
