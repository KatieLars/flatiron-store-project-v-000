class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #has_secure_password
  has_many :line_items
  has_many :carts
  has_many :items, through: :line_items
  has_many :order

  belongs_to :current_cart, class_name: 'Cart', foreign_key: 'current_cart_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def destroy_current_cart
    current_cart.delete
  end
end
