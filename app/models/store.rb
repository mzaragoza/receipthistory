class Store < ActiveRecord::Base
  has_many :accounts
  has_many :users, :through => :accounts
end
