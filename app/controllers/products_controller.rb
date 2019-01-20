class ProductsController < ApplicationController

  def index
    @header = "All Ideas"
    @products = Product.all
    if current_user
      @cart = Cart.new(user_id: current_user.id)
    end
    render 'index'
  end

  def new
    redirect_to root_path unless current_user
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(item_params)
      flash[:info] = "item updated"
      redirect_to item_path(@product)
    else
      flash[:info] = "Error updating item."
      redirect_to item_edit_path(@product)
    end
  end

  def create
    @product = Product.new(item_params)
    @product.user_id = current_user.id
    if @product.save
      if item_params[:image].present?
        @product.image.attach(item_params[:image])
      end
      flash[:info] = "Saved!"
      redirect_to root_path
    else
      flash[:alert] = "Error!"
    end
  end

  def item_params
    params.require(:product).permit(:id, :name, :description, :price, :amount, :image)
  end

end
