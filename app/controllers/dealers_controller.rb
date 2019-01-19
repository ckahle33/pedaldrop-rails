class DealersController < ApplicationController
  def index
  end

  def new
    @dealer = Dealer.new
  end

  def create

    raise 'hello'

  end

  def dealer_params
    params.require(:dealer).permit(:address, :address2, :city, :state, :description)
  end
end
