class Users::ItemsController < UserController
  expose(:items){ Item.order("id DESC").scoped{} }
  expose(:item , attributes: :item_params)

  def new
    item.ammount_purchased = 0
    item.ammount_sold = 0
    item.shipping_cost = 0
    item.paypal_selling_fee = 0
    item.paypal_selling_fee = 0
    item.purchased_date = Date.today
  end
  def create
    if item.ammount_purchased == nil
      item.ammount_purchased = 0
    end
    if item.ammount_sold == nil
      item.ammount_sold = 0
    end
    if item.shipping_cost == nil
      item.shipping_cost = 0
    end
    if item.paypal_selling_fee == nil
      item.paypal_selling_fee = 0
    end
    if item.paypal_selling_fee == nil
      item.paypal_selling_fee = 0
    end
    if item.save
      flash[:notice] = t(:item_was_successfully_created)
      redirect_to users_items_path
    else
      render :new
    end
  end
  def update
    if item.ammount_purchased == nil
      item.ammount_purchased = 0
    end
    if item.ammount_sold == nil
      item.ammount_sold = 0
    end
    if item.shipping_cost == nil
      item.shipping_cost = 0
    end
    if item.paypal_selling_fee == nil
      item.paypal_selling_fee = 0
    end
    if item.paypal_selling_fee == nil
      item.paypal_selling_fee = 0
    end
    if item.save
      flash[:notice] = t(:item_was_successfully_updated)
      redirect_to users_items_path
    else
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(
      :name ,
      :ammount_purchased ,
      :ammount_sold ,
      :shipping_cost ,
      :purchased_date ,
      :purchased_store ,
      :link_to_ebay ,
      :link_to_amazon ,
      :sold_site ,
      :returned ,
    )
  end
end

