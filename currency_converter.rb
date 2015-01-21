require './currency'

class CurrencyConverter
  attr_reader :conversion_rates

  def initialize(conversion_rates)
    @conversion_rates = conversion_rates
  end

  def convert(original_currency, new_currency_code)
    new_amount = (original_currency.amount*@conversion_rates[new_currency_code])/@conversion_rates[original_currency.code]
    return Currency.new(new_amount, new_currency_code)
  end

end
