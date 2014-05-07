class InvoicePresenter
  def create(invoice)
    @invoice = invoice
  end

  def each 
    @invoice["lines"]["data"].collect do |elem|
      {name: elem["object"],
       due: elem["period"]["end"],
       amount: elem["amount"]
      }
    end
  end
end
