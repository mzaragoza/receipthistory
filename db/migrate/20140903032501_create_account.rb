class CreateAccount < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string  :name   , default: ''
      t.boolean :active , default: true
      t.timestamps
    end
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :store_id
      t.boolean :owner, default: false
      t.timestamps
    end
  end
end
