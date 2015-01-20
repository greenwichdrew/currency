require 'minitest/autorun'
require 'minitest/pride'
require './currency'

class CurrencyTest < Minitest::Test

  def test_00_currency_class_exist
    assert Currency
  end

  def test_01_currency_have_amount
    currency = Currency.new(10, "USD")
    assert_equal 10, currency.amount
  end

  def test_02_currency_have_code
    currency = Currency.new(10, "USD")
    assert_equal "USD", currency.code
  end

  def test_03_currency_can_be_equal
    currency1 = Currency.new(10, "USD")
    currency2 = Currency.new(10, "USD")
    assert_equal true, currency1 == currency2

  end
end
