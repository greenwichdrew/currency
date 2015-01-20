class Currency
  attr_reader :amount

  def initialize(amount, currency_code)
    @amount = amount
    @code = currency_code
  end

  def code
    @code
  end

  def ==(other)
    self.amount == other.amount && self.code == other.code
  end
end
