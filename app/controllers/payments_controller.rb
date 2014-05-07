class PaymentController < ActionController::Base
  def index customer_id
    #TODO: authenticate
    @invoices = Stripe::Invoice.all(customer_id)
  end
  def show invoice_id
  end
  def create
  end
end
