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

  def test_03_currency_can_be_equal_with_same_code
    currency1 = Currency.new(100, "USD")
    currency2 = Currency.new(100, "USD")
    assert true, currency1.equal?(currency2)

  end

  def test_04_currency_can_be_added_with_same_code
    currency1 = Currency.new(100, "USD")
    currency2 = Currency.new(10, "USD")
    assert_equal Currency.new(110, "USD"), currency1 + currency2

  end

  def test_05_currency_can_be_subtracted_with_same_code
    currency1 = Currency.new(100, "USD")
    currency2 = Currency.new(10, "USD")
    assert_equal Currency.new(90, "USD"), currency1 - currency2

  end

  def test_06_currency_types_are_not_same_code
    assert_raises DifferentCurrencyCodeError do
      currency1 = Currency.new(100, "USD")
      currency2 = Currency.new(10, "EUR")
      currency1 + currency2
    end
  end

  def test_07_currencty_multiply_Fixnum_or_Float
    currency1 = Currency.new(100, "USD")
    assert_equal Currency.new(150.0, "USD"), currency1 * 1.5
  end
end
