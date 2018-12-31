class CartsController < ApplicationController
  def create
    cart = Cart.find_or_initialize_by(user_id: current_user.id)
    if cart.save
      CartItem.create(cart_id: cart.id, product_id: cart_params[:product_id])
      flash[:success] = "Item successfully added to your cart!"
      redirect_to products_path
    else
      flash[:danger] = "There was an error updating your cart"
      redirect_to products_path
    end
  end

  def show
    @cart = Cart.find(params[:id])
    if !current_user || @cart.id != current_user.cart.id
      redirect_to :root
      flash[:danger] = "You don't have access to view that page"
    end
  end

  def destroy

  end

  def edit
  end

  def update
    cart = Cart.find(cart_params["id"])
    if cart.cart_items.where(product_id: cart_params["product_id"]).first.destroy
      flash[:success] = "Item successfully removed from your cart!"
      redirect_to cart_path(cart)
    else
      flash[:danger] = "There was an error updating your cart"
      redirect_to cart_path(cart)
    end
  end

  def cart_params
    params.permit(:id, :product_id)
  end
end
