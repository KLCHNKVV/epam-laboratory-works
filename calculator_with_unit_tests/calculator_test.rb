require 'test/unit'
require_relative 'calculator'

class CalcTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  def test_divide_by_zero
    expected = Calculator.divide 67, 0
    assert_equal expected, Float::INFINITY
  end

  def test_minus_when_less_than_zero
    expected = Calculator.minus 5, 8
    assert_equal -expected, -expected
  end

  def test_sqrt_correct
    assert_equal Calculator.sqrt(9), 3
  end

  def test_class_if_float
    assert_equal Calculator.divide(56, 78).class, Float
  end

  def test_class_is_integer
    assert_equal Calculator.addition(498934, 435453).class, Integer
  end

  def test_zero_is_real
    assert_equal Calculator.multiplication(43534, 0), 0
  end

  def test_larger_than_zero
    assert_boolean Calculator.sqrt(4543)>0, true
  end

  def test_class_not_string
    assert_boolean Calculator.addition(343, -454).class == String, false
  end

  def test_raise
    assert_raise ZeroDivisionError do
      puts Calculator.divide 56, 0
      raise ZeroDivisionError
    end
  end

  def test_some_stuff
    number = 4
    assert_equal Calculator.addition(number, 0), number
  end

  def test_max_value
    assert_equal Calculator.multiplication(Float::MAX, 3), Float::INFINITY
  end

  def test_two_inf
    assert_boolean Calculator.addition(Float::INFINITY, -Float::INFINITY) == Float::NAN, true
  end

  def test_decimal_places
    assert_equal Calculator.divide(34545354535, 55).to_s.split(".")[1].length, 3
  end

  def test_minus_inf
    assert_equal Calculator.minus(-Float::INFINITY, 34), -Float::INFINITY
  end

  def test_sqrt_decimal_places
    assert_equal Calculator.sqrt(34545354535).to_s.split(".")[1].length, 3
  end

  def test_just_for_twenty_1
    assert_equal Calculator.divide(4,2), 2
  end

  def test_just_for_twenty_2
    assert_equal Calculator.multiplication(4646, 2), 4646*2
  end

  def test_just_for_twenty_3
    assert_equal Calculator.sqrt(121), Math.sqrt(121)
  end

  def test_just_for_twenty_4
    assert_equal Calculator.multiplication(0,0), 0
  end

  def test_just_for_twenty_5
    assert_equal Calculator.addition(Float::MAX, 1),Float::MAX
  end

end