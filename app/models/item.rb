class Item < ActiveRecord::Base

  def profit
    self.ammount_sold - (self.ammount_purchased + self.shipping_cost)
  end
end



