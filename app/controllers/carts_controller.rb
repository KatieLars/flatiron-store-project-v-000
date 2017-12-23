class CartsController < ApplicationController
  before_filter :authenticate_user!

  def show
   @current_cart = current_user.current_cart if current_user.current_cart
  end

  def checkout
    @current_cart = current_user.current_cart
    @current_cart.update(status: "submitted")
    @current_cart.update_item_inventory(@current_cart.line_items)
    current_user.destroy_current_cart
    redirect_to cart_path(@current_cart)
  end

end
