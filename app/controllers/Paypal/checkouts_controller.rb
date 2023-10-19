class Paypal::CheckoutsController < ApplicationController
  include PayPal::SDK::REST 

  def create

    payment = Payment.new({
      intent:'sale',
      payer:  {
        payment_method: 'paypal'
      },
      redirect_urls: {
        return_url: directors_path(current_director),
        cancel_url: plans_path
      },
      transactions: [
        {
          amount: {
            total: @current_plan.price,
            currency: 'COP'
          },
          description: 'Pago de plan',
          item_list: {
            items: @current_plan.to_paypal
          }
        }
      ]
    })

    if payment.create
      redirect_url = payment.links.find{ |v| v.rel == 'approval_url' }.href

      redirect_to redirect_url
    else
      redirect_to plans_path, alert: "Algo salio mal, intenta de nuevo"
    end
  end

end