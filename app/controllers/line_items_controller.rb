class LineItemsController < ApplicationController

  def create
    current_user.current_cart ||= Cart.find_or_create_by(user_id: current_user.id)
    cart = current_user.current_cart
    cart.add_item(params[:item_id]).save
    current_user.save
    redirect_to cart_path(cart)
  end

end
