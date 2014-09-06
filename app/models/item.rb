class Item < ActiveRecord::Base

  def profit
    self.ammount_sold - (self.ammount_purchased + self.shipping_cost + self.site_selling_fee + self.paypal_selling_fee)
  end
end



