class UsersController < Clearance::UsersController
  before_action :require_login

  def show
    @storage_types = current_user.storage_types
  end
end
