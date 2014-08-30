class Item < ActiveRecord::Base

  def profit
    (self.ammount_purchased + self.shipping_cost) - self.ammount_sold
  end
end



