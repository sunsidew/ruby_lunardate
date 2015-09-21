require 'minitest/autorun'
require 'ruby_lunardate'

class TestRubyLunarDate < Minitest::Test
  def test_from_solar_19790922_from_solar_19791111
    date = LunarDate.from_solar(1979, 11, 11)
    assert_equal(date.year, 1979)
    assert_equal(date.month, 9)
    assert_equal(date.day, 22)
    assert_equal(date.is_leap_month, false)

    lunar_date = LunarDate.to_solar(1979, 9, 22, false)
    assert_equal(lunar_date.year, 1979)
    assert_equal(lunar_date.month, 11)
    assert_equal(lunar_date.day, 11)
  end

  def test_from_solar_19000101_from_solar_19000131
    date = LunarDate.from_solar(1900, 1, 31)
    assert_equal(date.year, 1900)
    assert_equal(date.month, 1)
    assert_equal(date.day, 1)
    assert_equal(date.is_leap_month, false)

    lunar_date = LunarDate.to_solar(1900, 1, 1, false)
    assert_equal(lunar_date.year, 1900)
    assert_equal(lunar_date.month, 1)
    assert_equal(lunar_date.day, 31)
  end

  def test_from_solar_19020101_from_solar_19020208
    date = LunarDate.from_solar(1902, 2, 8)
    assert_equal(date.year, 1902)
    assert_equal(date.month, 1)
    assert_equal(date.day, 1)
    assert_equal(date.is_leap_month, false)

    lunar_date = LunarDate.to_solar(1902, 1, 1, false)
    assert_equal(lunar_date.year, 1902)
    assert_equal(lunar_date.month, 2)
    assert_equal(lunar_date.day, 8)
  end

  def test_from_solar_19040101_from_solar_19040216
    date = LunarDate.from_solar(1904, 2, 16)
    assert_equal(date.year, 1904)
    assert_equal(date.month, 1)
    assert_equal(date.day, 1)
    assert_equal(date.is_leap_month, false)

    lunar_date = LunarDate.to_solar(1904, 1, 1, false)
    assert_equal(lunar_date.year, 1904)
    assert_equal(lunar_date.month, 2)
    assert_equal(lunar_date.day, 16)
  end

  def test_from_solar_20140930_from_solar_20141023
    date = LunarDate.from_solar(2014, 10, 23)
    assert_equal(date.year, 2014)
    assert_equal(date.month, 9)
    assert_equal(date.day, 30)
    assert_equal(date.is_leap_month, false)

    lunar_date = LunarDate.to_solar(2014, 9, 30, false)
    assert_equal(lunar_date.year, 2014)
    assert_equal(lunar_date.month, 10)
    assert_equal(lunar_date.day, 23)
  end

  def test_from_solar_19870621_from_solar_19870815_leap
    date = LunarDate.from_solar(1987, 8, 15)
    assert_equal(date.year, 1987)
    assert_equal(date.month, 6)
    assert_equal(date.day, 21)
    assert_equal(date.is_leap_month, true)

    lunar_date = LunarDate.to_solar(1987, 6, 21, true)
    assert_equal(lunar_date.year, 1987)
    assert_equal(lunar_date.month, 8)
    assert_equal(lunar_date.day, 15)
  end

  # 3rd MONTHTYPE test case
  def test_from_solar_20171025_from_solar_20171212
    date = LunarDate.from_solar(2017, 12, 12)
    assert_equal(date.year, 2017)
    assert_equal(date.month, 10)
    assert_equal(date.day, 25)
    assert_equal(date.is_leap_month, false)

    lunar_date = LunarDate.to_solar(2017, 10, 25, false)
    assert_equal(lunar_date.year, 2017)
    assert_equal(lunar_date.month, 12)
    assert_equal(lunar_date.day, 12)
  end

  # 4th MONTHTYPE test case
  def test_from_solar_19870729_from_solar_19870921
    date = LunarDate.from_solar(1987, 9, 21)
    assert_equal(date.year, 1987)
    assert_equal(date.month, 7)
    assert_equal(date.day, 29)
    assert_equal(date.is_leap_month, false)

    lunar_date = LunarDate.to_solar(1987, 7, 29, false)
    assert_equal(lunar_date.year, 1987)
    assert_equal(lunar_date.month, 9)
    assert_equal(lunar_date.day, 21)
  end

  # 5th MONTHTYPE test case
  def test_from_solar_19551119_from_solar_19560101
    date = LunarDate.from_solar(1956, 1, 1)
    assert_equal(date.year, 1955)
    assert_equal(date.month, 11)
    assert_equal(date.day, 19)
    assert_equal(date.is_leap_month, false)

    lunar_date = LunarDate.to_solar(1955, 11, 19, false)
    assert_equal(lunar_date.year, 1956)
    assert_equal(lunar_date.month, 1)
    assert_equal(lunar_date.day, 1)
  end

  def test_solar_from_lunar_19550329_leap_double_case_check
    lunar_date = LunarDate.to_solar(1955, 3, 29, false)
    assert_equal(lunar_date.year, 1955)
    assert_equal(lunar_date.month, 4)
    assert_equal(lunar_date.day, 21)

    lunar_date_leap = LunarDate.to_solar(1955, 3, 29, true)
    assert_equal(lunar_date_leap.year, 1955)
    assert_equal(lunar_date_leap.month, 5)
    assert_equal(lunar_date_leap.day, 20)
  end

  def test_solar_from_lunar_20150908_not_leap_month_case_check
    lunar_date = LunarDate.to_solar(2015, 7, 26, false)
    assert_equal(lunar_date.year, 2015)
    assert_equal(lunar_date.month, 9)
    assert_equal(lunar_date.day, 8)

    lunar_date_leap = LunarDate.to_solar(2015, 7, 26, true)
    assert_equal(lunar_date_leap.year, 2015)
    assert_equal(lunar_date_leap.month, 9)
    assert_equal(lunar_date_leap.day, 8)
  end

  def test_from_lunar_solar_from_Date_class_variable_20150908
  	lunar_date = Date.new(2015,9,8).from_solar
  	assert_equal(lunar_date.year, 2015)
    assert_equal(lunar_date.month, 7)
    assert_equal(lunar_date.day, 26)
    assert_equal(lunar_date.class, LunarDate)

    solar_date = Date.new(2015,7,26).to_solar
  	assert_equal(solar_date.year, 2015)
    assert_equal(solar_date.month, 9)
    assert_equal(solar_date.day, 8)
    assert_equal(solar_date.class, Date)
  end
end