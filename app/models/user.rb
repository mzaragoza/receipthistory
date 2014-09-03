class User < ActiveRecord::Base

  has_many :accounts
  has_many :stores, :through => :accounts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :updating_password
  def name
    (self.first_name + self.last_name).titleize
  end
end
