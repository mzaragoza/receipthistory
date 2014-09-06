class AddCostFieldsToItems < ActiveRecord::Migration
  def change
    add_column :items, :site_selling_fee, :decimal
    add_column :items, :paypal_selling_fee, :decimal
  end
end
