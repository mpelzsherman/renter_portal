class PaymentsController < ApplicationController 
  before_action :authenticate_account!

  def index 
    return unless current_account.is_customer?
    customer_id = current_account.customer.stripe_customer_id
    @invoices = Stripe::Invoice.all(customer: customer_id)
    @invoice_presenter = InvoicePresenter.new(@invoices)
  end

  def show invoice_id
  end
  def create
  end
end
