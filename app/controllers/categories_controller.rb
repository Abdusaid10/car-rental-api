class CategoriesController < ApplicationController
  skip_before_action :authorize_request, only: %i[index show]
  before_action :set_category, only: %i[show update destroy]

  def index
    @categories = Category.all

    json_response(@categories)
  end

  def show
    json_response(@category)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save!
      response = { message: Message.category_created }
      json_response(response, :created)
    else
      response = { message: Message.something_went_wrong }
      json_response(response, :unprocessable_entity)
    end
  end

  def update
    if @category.update(category_params)
      response = { message: Message.categroy_updated }
      json_response(response)
    else
      response = { message: Message.something_went_wrong }
      json_response(response, :unprocessable_entity)
    end
  end

  def destroy
    @category.destroy
    response = { message: Message.category_destroyed }
    json_response(response)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.permit(:category)
  end

  # def admin_user
  #   current_user.admin ? @category = Category.find(params[:id]) : redirect_to(root_url)
  # end
end
