# frozen_string_literal: true

class StorageTypesController < ApplicationController
  before_action :require_login
  before_action :set_storage_type, only: [:show, :edit, :update, :destroy]
  before_action :scope_to_current_user, only: [:show, :edit, :update, :destroy]

  # GET /storage_types
  # GET /storage_types.json
  def index
    @storage_types = current_user.storage_types
  end

  # GET /storage_types/1
  # GET /storage_types/1.json
  def show
    @categories = @storage_type.categories
  end

  # GET /storage_types/new
  def new
    @storage_type = StorageType.new
  end

  # GET /storage_types/1/edit
  def edit; end

  # POST /storage_types
  # POST /storage_types.json
  # rubocop:disable Metrics/AbcSize
  def create
    @storage_type = StorageType.new(storage_type_params.merge(user: current_user))

    respond_to do |format|
      if @storage_type.save
        format.html { redirect_to @storage_type, notice: "Storage type was successfully created." }
        format.json { render :show, status: :created, location: @storage_type }
      else
        format.html { render :new }
        format.json { render json: @storage_type.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/AbcSize

  # PATCH/PUT /storage_types/1
  # PATCH/PUT /storage_types/1.json
  def update
    respond_to do |format|
      if @storage_type.update(storage_type_params)
        format.html { redirect_to @storage_type, notice: "Storage type was successfully updated." }
        format.json { render :show, status: :ok, location: @storage_type }
      else
        format.html { render :edit }
        format.json { render json: @storage_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_types/1
  # DELETE /storage_types/1.json
  def destroy
    @storage_type.destroy
    respond_to do |format|
      format.html do
        redirect_to dashboard_path(current_user), notice: "The storage type was cast into the fire!"
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_storage_type
    @storage_type = StorageType.find(params[:id])
  end

  def scope_to_current_user
    redirect_to sign_in_path unless @storage_type.user == current_user
  end

  # Only allow a list of trusted parameters through.
  def storage_type_params
    params.require(:storage_type).permit(:name, :notes)
  end
end
