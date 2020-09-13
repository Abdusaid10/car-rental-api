class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  # before_action :admin_user, only: [:create, :edit, :update, :destroy]

  def index
    @cars = Car.all
  
    json_response(@cars)
  end

  def new
    @car = Car.new
  end

  def edit
    json_response(@car)
  end

  def show 
    @carManufacturer = Manufacturer.find_by(id:  @car.manufacturer_id)
    @carCategory = Category.find_by(id: @car.category_id)
   
    json_response(@car)
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
      params.require(:car).permit(:manufacturer_id, :category_id, :model, :color, :status, :price, :description, :year, :logo, :img, :images)
    end

    def admin_user      
      redirect_to(root_url) unless !current_user.admin
    end
end