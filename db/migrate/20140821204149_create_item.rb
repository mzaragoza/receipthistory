class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name,              null: false, default: ""
      t.decimal  :ammount_purchased ,      null: false, default: nil
      t.decimal  :ammount_sold,            null: false, default: nil
      t.decimal  :shipping_cost,           null: false, default: nil
      t.date     :purchased_date
      t.string   :purchased_store,         null: false, default: ""
      t.string   :link_to_ebay,            null: false, default: ""
      t.string   :link_to_amazon,          null: false, default: ""
      t.string   :sold_site,               null: false, default: ""
      t.boolean  :returned,                null: false, default: false
      t.timestamps
    end
  end
end
