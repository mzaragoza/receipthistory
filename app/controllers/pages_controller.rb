class PagesController < PublicController
  before_filter :redirect_if_logged_in


  private
  def redirect_if_logged_in
    if user_signed_in?
      flash[:notice] = 'You must sign out first!'
      redirect_to users_root_path
    else
      redirect_to user_session_path
    end
  end
end

