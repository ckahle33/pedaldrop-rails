class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = (current_user.current_cart.total * 100)

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    current_user.update(stripe_customer_id: customer.id)

    current_user.current_cart.cart_items.map do |item|
      p = item.product
      p.update(amount: p.amount - 1)
    end

    current_user.orders.create(cart_id: current_user.current_cart.id)
    current_user.current_cart.update(paid: true)

    redirect_to thanks_path

    # Write a background job that charges each users card at a later step
    # charge = Stripe::Charge.create(
    #   :customer    => customer.id,
    #   :amount      => @amount,
    #   :description => 'Rails Stripe customer',
    #   :currency    => 'usd'
    # )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def thanks
  end
end
