class CartsController < ApplicationController
  def create
  end

  def show
    unless current_user
      redirect_to login_path
      flash[:info] = "You need to sign in to view your cart."
    else
      @cart = current_user.carts.current.first
    end
  end

  def destroy
    @cart = current_user.current_cart
    if @cart.cart_items.where(product_id: cart_params["product_id"]).first.destroy
      flash[:success] = "Item successfully removed from your cart!"
      redirect_to cart_path
    else
      flash[:danger] = "There was an error updating your cart"
      redirect_to cart_path
    end
  end

  def edit
  end

  def update
    @cart = current_user.current_cart || Cart.new(user_id: current_user.id)
    if @cart.save
      CartItem.create(cart_id: @cart.id, product_id: cart_params[:product_id])
      flash[:success] = "Item successfully added to your cart!"
      redirect_to products_path
    else
      flash[:danger] = "There was an error updating your cart"
      redirect_to products_path
    end
  end

  def cart_params
    params.permit(:id, :product_id)
  end
end
