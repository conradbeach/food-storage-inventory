# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :require_login
  before_action :set_storage_type
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :scope_to_current_user, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = current_user.categories
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @food_items = @category.food_items
  end

  # GET /categories/new
  def new
    @category = Category.new
    @storage_types = current_user.storage_types
  end

  # GET /categories/1/edit
  def edit
    @storage_types = current_user.storage_types
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params.merge(storage_type: @storage_type))
    @storage_types = current_user.storage_types

    respond_to do |format|
      if @category.save
        format.html do
          redirect_to [@storage_type, @category], notice: "Category was successfully created."
        end
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html do
          redirect_to [@storage_type, @category], notice: "Category was successfully updated."
        end
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to @storage_type, notice: "The category was cast into the fire!" }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  def set_storage_type
    @storage_type = StorageType.find(params[:storage_type_id])
  end

  def scope_to_current_user
    redirect_to sign_in_path unless @category.storage_type.user == current_user
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(
      :storage_type_id,
      :name,
      :unit_type,
      :units_per_year_per_adult,
      :notes,
    )
  end
end
