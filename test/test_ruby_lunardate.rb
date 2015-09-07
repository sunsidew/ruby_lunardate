require 'minitest/autorun'
require 'ruby_lunardate'

class TestRubyLunarDate < Minitest::Test
  def test_to_lunar_19790922_from_solar_19791111
    date = LunarDate.to_lunar(1979, 11, 11)
    assert_equal(date.year, 1979)
    assert_equal(date.month, 9)
    assert_equal(date.day, 22)
    assert_equal(date.is_leap_month, false)
  end

  def test_to_lunar_19000101_from_solar_19000131
    date = LunarDate.to_lunar(1900, 1, 31)
    assert_equal(date.year, 1900)
    assert_equal(date.month, 1)
    assert_equal(date.day, 1)
    assert_equal(date.is_leap_month, false)
  end

  def test_to_lunar_19020101_from_solar_19020208
    date = LunarDate.to_lunar(1902, 2, 8)
    assert_equal(date.year, 1902)
    assert_equal(date.month, 1)
    assert_equal(date.day, 1)
    assert_equal(date.is_leap_month, false)
  end

  def test_to_lunar_19040101_from_solar_19040216
    date = LunarDate.to_lunar(1904, 2, 16)
    assert_equal(date.year, 1904)
    assert_equal(date.month, 1)
    assert_equal(date.day, 1)
    assert_equal(date.is_leap_month, false)
  end

  def test_to_lunar_20140930_from_solar_20141023
    date = LunarDate.to_lunar(2014, 10, 23)
    assert_equal(date.year, 2014)
    assert_equal(date.month, 9)
    assert_equal(date.day, 30)
    assert_equal(date.is_leap_month, false)
  end

  def test_to_lunar_19870621_from_solar_19870815_leap
    date = LunarDate.to_lunar(1987, 8, 15)
    assert_equal(date.year, 1987)
    assert_equal(date.month, 6)
    assert_equal(date.day, 21)
    assert_equal(date.is_leap_month, true)
  end

  # 3rd MONTHTYPE test case
  def test_to_lunar_20171025_from_solar_20171212
    date = LunarDate.to_lunar(2017, 12, 12)
    assert_equal(date.year, 2017)
    assert_equal(date.month, 10)
    assert_equal(date.day, 25)
    assert_equal(date.is_leap_month, false)
  end

  # 4th MONTHTYPE test case
  def test_to_lunar_19870729_from_solar_19870921
    date = LunarDate.to_lunar(1987, 9, 21)
    assert_equal(date.year, 1987)
    assert_equal(date.month, 7)
    assert_equal(date.day, 29)
    assert_equal(date.is_leap_month, false)
  end

  # 5th MONTHTYPE test case
  def test_to_lunar_19551119_from_solar_19560101
    date = LunarDate.to_lunar(1956, 1, 1)
    assert_equal(date.year, 1955)
    assert_equal(date.month, 11)
    assert_equal(date.day, 19)
    assert_equal(date.is_leap_month, false)
  end
end