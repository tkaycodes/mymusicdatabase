class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = params[:customamount]
    @convertedamount = @amount.to_i
    @dollaramount = @convertedamount*100
    customer = Stripe::Customer.create(
      :email => 'customer@mmdb.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @dollaramount,
      :description => 'mmdb customer',
      :currency    => 'cad'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
