class StorageTypesController < ApplicationController
  before_action :set_storage_type, only: [:show, :edit, :update, :destroy]

  # GET /storage_types
  # GET /storage_types.json
  def index
    @storage_types = StorageType.all
  end

  # GET /storage_types/1
  # GET /storage_types/1.json
  def show
  end

  # GET /storage_types/new
  def new
    @storage_type = StorageType.new
  end

  # GET /storage_types/1/edit
  def edit
  end

  # POST /storage_types
  # POST /storage_types.json
  def create
    @storage_type = StorageType.new(storage_type_params)

    respond_to do |format|
      if @storage_type.save
        format.html { redirect_to @storage_type, notice: 'Storage type was successfully created.' }
        format.json { render :show, status: :created, location: @storage_type }
      else
        format.html { render :new }
        format.json { render json: @storage_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storage_types/1
  # PATCH/PUT /storage_types/1.json
  def update
    respond_to do |format|
      if @storage_type.update(storage_type_params)
        format.html { redirect_to @storage_type, notice: 'Storage type was successfully updated.' }
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
      format.html { redirect_to storage_types_url, notice: 'Storage type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_type
      @storage_type = StorageType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def storage_type_params
      params.require(:storage_type).permit(:user_id, :name)
    end
end
