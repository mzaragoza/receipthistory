class Users::DashboardController < UserController
  def index
    redirect_to users_items_path
  end
end
