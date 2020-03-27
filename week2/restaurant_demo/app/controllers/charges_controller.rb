# frozen_string_literal: true

class ChargesController < ApplicationController
  def create
    @amount = current_order.subtotal * 100

    customer = Stripe::Customer.create(email: params[:stripeEmail],
                                       source: params[:stripeToken])

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Online Order #{current_order.id}",
      currency: usd
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :cart
  end
end
