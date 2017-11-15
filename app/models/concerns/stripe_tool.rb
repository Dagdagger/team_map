 module StripeTool
   def self.create_customer
     Stripe::Customer.create(
       email: email,
       source: stripe_token
     )
   end

   def self.create_charge(customer_id: customer_id, amount: amount, description: description)
     Stripe::charge.create(
       customer: customer_id,
       amount: amount,
       description: description,
       currency: 'usd'
     )
   end
 end
