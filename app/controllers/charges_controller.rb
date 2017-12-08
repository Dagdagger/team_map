
class ChargesController < ApplicationController

  def new
    @coachprofile = Coachprofile.find(params[:id])
    @amount = @coachprofile.price * 100
  end

  def thanks
  end

  def create
    # Amount in cents
    @amount = 500
    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken]
    )

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount,
                                      description: @description
    )
    redirect_to thanks_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
  def description
    @description = "Some amazing Training"
  end


  def amount_to_be_charged
    @amount = 500
  end
end
