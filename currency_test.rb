require 'minitest/autorun'
require 'minitest/pride'
require './currency'
require './currency_converter'


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
    currency1 = Currency.new(100, "USD")
    currency2 = Currency.new(10, "EUR")
    assert_raises(DifferentCurrencyCodeError) do
      currency1 + currency2
    end
    assert_raises(DifferentCurrencyCodeError) do
      currency1 - currency2
    end
  end

  def test_07_currencty_multiply_Fixnum
    currency1 = Currency.new(100, "USD")
    assert_equal Currency.new(200, "USD"), (currency1 * 2)
    refute Currency.new(200, "USD") == (currency1 * 3)
    assert_equal Fixnum, (currency1 * 2).amount.class

  end

  def test_08_currencty_multiply_Float
    currency1 = Currency.new(100, "USD")
    assert_equal Currency.new(150, "USD"), (currency1 * 1.5)
    refute Currency.new(300, "USD") == (currency1 * 3.5)
    assert_equal Float, (currency1 * 1.5).amount.class

  end

  def test_09_currency_converter_class_exist
    assert CurrencyConverter
  end

  def test_10_currency_converter_value_exist
      rates = {USD: 1.00, EUR: 0.74}
      converter = CurrencyConverter.new(rates)
      assert_equal converter.conversion_rates, rates

  end

  def test_11_currency_converter_can_create_currency_obj_from_other_obj
    rates = {USD: 1.00, EUR: 0.74}
    money_bag = CurrencyConverter.new(rates)
    assert money_bag.convert(Currency.new(1, :USD),:USD) == Currency.new(1,:USD)

  end
  def test_12_currency_converter_can_change_currencies
    rates = {USD: 1.00, EUR: 0.74}
    money_bag = CurrencyConverter.new(EUR: 0.74)
    currency = Currency.new(25,:USD)
    money_bag = Currency.new.convert(currency,:EUR)
  end

end
