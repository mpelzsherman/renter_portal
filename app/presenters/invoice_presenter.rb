class InvoicePresenter
  include Enumerable
  def initialize(invoice)
    @invoices = invoice
  end

  def empty?
    @invoices["data"].empty?
  end

  def each (&block)
    filtered_items = @invoices['data'][0]['lines'].collect do |elem|
      {name: elem["object"],
       due: Date.new(elem["period"]["end"]).strftime('%d-%m'),
       amount: elem["amount"] / 100
      }
    end
    Rails.logger.debug filtered_items.inspect
    filtered_items.each(&block)
  end
end
