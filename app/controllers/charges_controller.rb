class ChargesController < ApplicationController


  def new
    @coachprofile = Coachprofile.find(params[:id])
    @charge = @coachprofile.charges.new
  end


  def create
    # Amount in cents
    @coachprofile = Coachprofile.find(params[:coachprofile])
    @charge = @coachprofile.charges.create(:user_id => current_user.id, :amount => @coachprofile.price)
    @amount = @charge.amount * 100

    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken]
    )

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount,
                                      description: @description
    )
    redirect_to controller: 'charges', action: 'thanks', amount: @amount

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def thanks
    @amount = params[:amount]
    @amount = @amount.to_i
  end

  private
  def description
    @description = "Some amazing Training"
  end

  def charges_params
    params.require(:charge).permit(:user_id, :amount)
  end
end
