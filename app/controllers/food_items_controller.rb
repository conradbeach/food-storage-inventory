class FoodItemsController < ApplicationController
  before_action :require_login
  before_action :set_storage_type
  before_action :set_category
  before_action :set_food_item, only: [:show, :edit, :update, :destroy]
  before_action :scope_to_current_user, only: [:show, :edit, :update, :destroy]

  # GET /food_items
  # GET /food_items.json
  def index
    @food_items = FoodItem.all
  end

  # GET /food_items/1
  # GET /food_items/1.json
  def show
  end

  # GET /food_items/new
  def new
    @food_item = FoodItem.new
    @categories = current_user.categories

    if params[:another_item]
      last_item_attrs = current_user.food_items.last.attributes.slice("name", "units", "expiration_date")
      @food_item.assign_attributes(last_item_attrs)
    end
  end

  # GET /food_items/1/edit
  def edit
    @categories = current_user.categories
  end

  # POST /food_items
  # POST /food_items.json
  def create
    @food_item = FoodItem.new(food_item_params.merge(category: @category))

    respond_to do |format|
      if @food_item.save
        notice = "Food item was successfully created. (ID: #{@food_item.id})"

        format.html do
          if params[:food_item][:another_item] == "1"
            redirect_to new_storage_type_category_food_item_path(@storage_type, @category, another_item: true), notice: notice
          else
            redirect_to [@storage_type, @category, @food_item], notice: notice
          end
        end
        format.json { render :show, status: :created, location: @food_item }
      else
        format.html { render :new }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_items/1
  # PATCH/PUT /food_items/1.json
  def update
    respond_to do |format|
      if @food_item.update(food_item_params)
        format.html { redirect_to [@storage_type, @category, @food_item], notice: 'Food item was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_item }
      else
        format.html { render :edit }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_items/1
  # DELETE /food_items/1.json
  def destroy
    @food_item.destroy
    respond_to do |format|
      format.html { redirect_to [@storage_type, @category], notice: 'Food item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_type
      @storage_type = StorageType.find(params[:storage_type_id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    def scope_to_current_user
      redirect_to sign_in_path unless @food_item.category.storage_type.user == current_user
    end

    # Only allow a list of trusted parameters through.
    def food_item_params
      params.require(:food_item).permit(:name, :units, :expiration_date)
    end
end
