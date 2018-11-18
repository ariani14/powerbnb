class PaymentController < ApplicationController
 def new
 
  	@client_token = Braintree::ClientToken.generate
  	@reservation = Reservation.find(params['reservation_id'])
  end


  def checkout
   
   
   
  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  price = Reservation.find(params['reservation_id']).price
  result = Braintree::Transaction.sale(
   :amount => price, #this is currently hardcoded
   :payment_method_nonce => nonce_from_the_client,
   :options => {
      :submit_for_settlement => true
    }
   )

  if result.success?
   render "reservations/index", :flash => { :success => "Transaction successful!" }
  else
 render "reservations/index", :flash => { :error => "Transaction failed. Please try again." }
  end
end
end
