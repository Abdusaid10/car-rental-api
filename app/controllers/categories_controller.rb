class CategoriesController < ApplicationController
  before_action :set_category, only: [:create, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
    # respond_to do |f|
    #   f.html
    #   f.json { render :json => @categories }
    # end
    json_response(@categories)
  end

  def new 
    @category = Category.new
  end
  
  def edit
    json_response(@category)
  end
  def show 
    # respond_to do |f|
    #   f.html
    #   # f.json { render json: @category }
    #   f.json { json_response(@category) }
    # end
    json_response(@category)
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      # flash[:info] = "Category #{@category.type} added"
      # respond_to do |f|
      #   f.html { 
      #     flash[:info] = "Category #{@category.category} added"
      #     redirect_to @category
      #   }
      #   # f.json { render json: @category, status: :created }
      #   f.json { json_response(@category, :created) }
      # end
      response = { message: Message.categroy_created }
      json_response(response, :created)
    else
      # respond_to do |f|
      #   f.html { render 'new' }
      #   # f.json { render json: @category.errors, status: :unprocessable_entity }
      #   f.json { json_response(@category, :unprocessable_entity) }
      # end
      response = { message: Message.something_went_wrong }
      json_response(response, :unprocessable_entity)
    end
  end

  def update
    if @category.update_attributes(category_params)
      # respond_to do |f|
      #   f.html { 
      #     flash[:success] = "Categorie #{@category.category} updated"
      #     redirect_to @category
      #   }
      #   # f.json  { render json: @category }
      #   f.json { json_response(@category) }
      # end
      response = { message: Message.categroy_updated }
      json_response(response)
    else
      # respond_to do |f|
      #   f.html { render 'edit' }
      #   # f.json { render json: @category.errors, status: :unprocessable_entity }
      #   f.json { json_response(@category, :unprocessable_entity) }
      # end
      response = { message: Message.something_went_wrong }
      json_response(response, :unprocessable_entity)
    end
  end

  def destroy
    @Categorie.destroy 
    # respond_to do |f|
    #   f.html { flash[:info] = "Category #{@category.category} removed" }
    #   f.json { render json: "Categorie #{@category.category} removed" }
    # end
    response = { message: Message.category_destroyed }
    json_response(response)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:category)
    end

    # def admin_user
    #   current_user.admin ? @category = Category.find(params[:id]) : redirect_to(root_url)
    # end
end