class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :paypal_init, :except => [:index]
  def index
    @plan= Plan.last
  end
  def create_order
    price = '100'
    request = PayPalCheckoutSdk::Orders::OrdersCreateRequest::new
    request.request_body({
      :intent => 'CAPTURE',
      :purchase_units => [
        {
          :amount => {
            :value => price
          }
        }
      ]
    })
  
    begin
      response = @client.execute request
      order = Order.new
      order.price = price.to_i
      order.token = response.result.id
      if order.save
        return render :json => {:token => response.result.id}, :status => :ok
      end
    rescue PayPalHttp::HttpError => ioe
      # HANDLE THE ERROR
    end
  end
  def capture_order
    request = PayPalCheckoutSdk::Orders::OrdersCaptureRequest::new params[:order_id]
  
    begin
      response = @client.execute request
      order = Order.find_by :token => params[:order_id]
      order.paid = response.result.status == 'COMPLETED'
  
      if order.save
        return render :json => {:status => response.result.status}, :status => :ok
      end
    rescue PayPalHttp::HttpError => ioe
      # HANDLE THE ERROR
    end
  end
  private
  def paypal_init
    client_id = Rails.application.credentials.paypal_client_id
    client_secret Rails.application.credentials.paypal_client_secret
    environment = PayPal::SandboxEnvironment.new client_id, client_secret
    @client = PayPal::PayPalHttpClient.new environment
  end
end