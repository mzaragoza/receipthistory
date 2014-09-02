class Users::UsersController < UserController
  before_filter :check_password_submitted, :only => :update
  expose(:users){ User.order("id DESC").scoped{} }
  expose(:user, attributes: :user_params)

  def create
    if user.save
      flash[:notice] = t(:user_was_successfully_created)
      redirect_to users_users_path
    else
      render :new
    end
  end
  def update
    if user.save
      flash[:notice] = t(:user_was_successfully_updated)
      redirect_to users_users_path
    else
      render :edit
    end
  end
  private
  def check_password_submitted
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      user.updating_password = false
    else
      user.updating_password = true
    end
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :active,
    )
  end
end
