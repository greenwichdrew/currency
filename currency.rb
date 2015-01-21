class DifferentCurrencyCodeError<StandardError
end

class Currency
  attr_reader :amount

  def initialize(amount, currency_code)
    @amount = amount
    @code = currency_code
  end

  def code
    @code
  end

  def ==(num)
    (self.amount == num.amount) && (self.code == num.code)
  end

  def +(num)
    if num.code == self.code
      new_amount = self.amount + num.amount
      Currency.new(new_amount, self.code)
    else
      #num.code != self.code
      raise DifferentCurrencyCodeError,"Two different currencies"
    end
  end

  def -(num)
    if num.code == self.code
      new_amount = self.amount - num.amount
      Currency.new(new_amount, self.code)
    else
      #num.code != self.code
      raise DifferentCurrencyCodeError,"Two different currencies"
    end
  end

  def *(num1)
    new_amount = self.amount.to_i * num1
    Currency.new(new_amount, self.code)
  end

  def *(num2)
    new_amount = self.amount.to_f * num2
    Currency.new(new_amount, self.code)
  end



end
