# frozen_string_literal: true

class UsersController < Clearance::UsersController
  before_action :require_login

  def show
    @storage_types = current_user.storage_types
    @expiring_food_item_groups = current_user
      .expiring_food_items
      .sort_by(&:expiration_date)
      .group_by(&:name)
  end

  def edit; end

  # PATCH/PUT /user/1
  # PATCH/PUT /user/1.json
  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to dashboard_path, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:adults_providing_for)
  end
end
