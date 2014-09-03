class Users::StoresController < UserController
  expose(:stores){ current_user.stores.order("id DESC").scoped{} }
  expose(:store , attributes: :store_params)

  def create
    if store.save
      add_to_account
      flash[:notice] = t(:store_was_successfully_created)
      redirect_to users_stores_path
    else
      render :new
    end
  end
  def update
    if store.save
      flash[:notice] = t(:store_was_successfully_updated)
      redirect_to users_stores_path
    else
      render :edit
    end
  end

  def remove
    unless store.accounts.where(:user_id => params[:user_id]).last.owner
      store.accounts.where(:user_id => params[:user_id]).delete_all
    end
    redirect_to users_store_members_path(store)
  end

  private

  def add_to_account
    current_user.accounts.create(:store_id => store.id, :owner => true)
  end

  def store_params
    params.require(:store).permit(
      :name ,
      :active ,
    )
  end
end


