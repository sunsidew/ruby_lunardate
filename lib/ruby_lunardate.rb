require 'date'

KOREAN_LUNAR_YEAR_INFO = [
  [384, 1, 2, 1, 1, 2, 1, 2, 4, 2, 2, 1, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1].freeze,
  [355, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2].freeze,
  [383, 1, 2, 1, 2, 3, 2, 1, 1, 2, 2, 1, 2].freeze,
  [354, 2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1].freeze,
  [355, 2, 2, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2].freeze,
  [384, 1, 2, 2, 5, 1, 2, 1, 2, 1, 2, 1, 2].freeze,
  [354, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1].freeze,
  [355, 2, 1, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2].freeze,
  [384, 1, 4, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1].freeze,
  [384, 2, 1, 2, 1, 1, 4, 1, 2, 2, 1, 2, 2].freeze,
  [354, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2].freeze,
  [354, 2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2].freeze,
  [384, 2, 2, 1, 2, 4, 1, 2, 1, 2, 1, 1, 2].freeze,
  [355, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2].freeze,
  [354, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1].freeze,
  [384, 2, 3, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1].freeze,
  [355, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2].freeze,
  [384, 1, 2, 1, 1, 2, 1, 4, 2, 2, 1, 2, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2].freeze,
  [354, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2].freeze,
  [384, 2, 1, 2, 2, 3, 2, 1, 1, 2, 1, 2, 2].freeze,
  [354, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2].freeze,
  [354, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1].freeze,
  [385, 2, 1, 2, 4, 2, 1, 2, 2, 1, 2, 1, 2].freeze,
  [354, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1].freeze,
  [355, 2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2].freeze,
  [384, 1, 4, 1, 2, 1, 1, 2, 2, 1, 2, 2, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2].freeze,
  [383, 1, 2, 2, 1, 1, 4, 1, 2, 1, 2, 2, 1].freeze,
  [354, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1].freeze,
  [355, 2, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2].freeze,
  [384, 1, 2, 2, 1, 6, 1, 2, 1, 2, 1, 1, 2].freeze,
  [355, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 2].freeze,
  [354, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1].freeze,
  [384, 2, 1, 5, 1, 2, 1, 2, 1, 2, 2, 2, 1].freeze,
  [354, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1].freeze,
  [384, 2, 2, 1, 1, 2, 1, 5, 1, 2, 2, 1, 2].freeze,
  [354, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2].freeze,
  [354, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1].freeze,
  [384, 2, 2, 1, 2, 2, 5, 1, 1, 2, 1, 2, 1].freeze,
  [355, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 1, 2].freeze,
  [355, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2].freeze,
  [384, 1, 1, 2, 5, 1, 2, 1, 2, 2, 1, 2, 2].freeze,
  [354, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2].freeze,
  [354, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2].freeze,
  [384, 2, 4, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2].freeze,
  [354, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2].freeze,
  [384, 2, 2, 1, 2, 1, 2, 3, 2, 1, 2, 1, 2].freeze,
  [354, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1].freeze,
  [355, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2].freeze,
  [384, 1, 2, 1, 2, 5, 2, 1, 2, 1, 2, 1, 2].freeze,
  [355, 1, 2, 1, 1, 2, 2, 1, 2, 2, 1, 2, 2].freeze,
  [354, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2].freeze,
  [384, 2, 1, 5, 1, 1, 2, 1, 2, 1, 2, 2, 2].freeze,
  [354, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2].freeze,
  [384, 2, 1, 2, 1, 2, 1, 1, 4, 2, 1, 2, 2].freeze,
  [354, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2].freeze,
  [354, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1].freeze,
  [384, 2, 1, 2, 1, 2, 4, 2, 1, 2, 1, 2, 1].freeze,
  [355, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1].freeze,
  [384, 2, 1, 2, 3, 2, 1, 2, 1, 2, 2, 2, 1].freeze,
  [355, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2].freeze,
  [354, 1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2].freeze,
  [383, 1, 2, 4, 2, 1, 1, 2, 1, 1, 2, 2, 1].freeze,
  [355, 2, 2, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2].freeze,
  [384, 1, 2, 2, 1, 2, 1, 4, 2, 1, 2, 1, 2].freeze,
  [354, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1].freeze,
  [355, 2, 1, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2].freeze,
  [384, 1, 2, 1, 1, 4, 2, 1, 2, 2, 2, 1, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1].freeze,
  [354, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2, 1].freeze,
  [384, 2, 2, 1, 4, 1, 2, 1, 1, 2, 2, 1, 2].freeze,
  [354, 2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2].freeze,
  [384, 2, 2, 1, 2, 1, 2, 1, 4, 2, 1, 1, 2].freeze,
  [354, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1].freeze,
  [355, 2, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1].freeze,
  [384, 2, 1, 1, 2, 1, 6, 1, 2, 2, 1, 2, 1].freeze,
  [355, 2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2].freeze,
  [384, 2, 1, 2, 3, 2, 1, 1, 2, 2, 1, 2, 2].freeze,
  [354, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2].freeze,
  [384, 2, 1, 2, 2, 1, 1, 2, 1, 1, 4, 2, 2].freeze,
  [354, 1, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2].freeze,
  [354, 1, 2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1].freeze,
  [385, 2, 1, 2, 2, 1, 4, 2, 2, 1, 2, 1, 2].freeze,
  [354, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1].freeze,
  [355, 2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2].freeze,
  [384, 1, 2, 1, 1, 4, 1, 2, 2, 1, 2, 2, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2].freeze,
  [354, 1, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2].freeze,
  [383, 1, 2, 4, 2, 1, 2, 1, 1, 2, 1, 2, 1].freeze,
  [355, 2, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2].freeze,
  [384, 1, 2, 2, 1, 2, 2, 1, 4, 2, 1, 1, 2].freeze,
  [355, 1, 2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2].freeze,
  [354, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1].freeze,
  [384, 2, 1, 1, 2, 3, 2, 2, 1, 2, 2, 2, 1].freeze,
  [354, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1].freeze,
  [354, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1].freeze,
  [384, 2, 2, 2, 3, 2, 1, 1, 2, 1, 2, 1, 2].freeze,
  [354, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1].freeze,
  [355, 2, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2].freeze,
  [384, 1, 4, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2].freeze,
  [354, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 1].freeze,
  [385, 2, 1, 2, 1, 2, 1, 4, 2, 2, 1, 2, 2].freeze,
  [354, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2].freeze,
  [354, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2].freeze,
  [384, 2, 2, 1, 1, 4, 1, 2, 1, 2, 1, 2, 2].freeze,
  [354, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2].freeze,
  [354, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1].freeze,
  [384, 2, 1, 6, 2, 1, 2, 1, 1, 2, 1, 2, 1].freeze,
  [355, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2].freeze,
  [384, 1, 2, 1, 2, 1, 2, 1, 2, 4, 2, 1, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2, 1].freeze,
  [355, 2, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2].freeze,
  [384, 1, 2, 1, 2, 3, 2, 1, 2, 1, 2, 2, 2].freeze,
  [354, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2].freeze,
  [354, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2].freeze,
  [384, 2, 1, 2, 4, 2, 1, 1, 2, 1, 2, 1, 2].freeze,
  [354, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1].freeze,
  [355, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2].freeze,
  [384, 1, 4, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1].freeze,
  [384, 2, 1, 2, 1, 1, 4, 2, 1, 2, 2, 2, 1].freeze,
  [355, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2].freeze,
  [354, 1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2].freeze,
  [383, 1, 2, 2, 1, 4, 1, 2, 1, 1, 2, 2, 1].freeze,
  [355, 2, 2, 1, 2, 2, 1, 1, 2, 1, 1, 2, 2].freeze,
  [354, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1].freeze,
  [384, 2, 1, 4, 2, 1, 2, 2, 1, 2, 1, 2, 1].freeze,
  [355, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2].freeze,
  [384, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 4, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1].freeze,
  [354, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2].freeze,
  [384, 2, 2, 1, 2, 1, 5, 1, 1, 2, 2, 1, 2].freeze,
  [354, 2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2].freeze,
  [354, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1].freeze,
  [384, 2, 2, 1, 2, 4, 2, 1, 2, 1, 2, 1, 1].freeze,
  [355, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 2, 1].freeze,
  [355, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2].freeze,
  [384, 1, 4, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2].freeze,
  [354, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2].freeze,
  [384, 2, 1, 2, 1, 1, 2, 3, 2, 1, 2, 2, 2].freeze,
  [354, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2].freeze,
  [354, 2, 1, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2].freeze,
  [384, 2, 1, 2, 2, 5, 1, 2, 1, 1, 2, 1, 2].freeze,
  [354, 1, 2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1].freeze,
  [355, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1].freeze
].freeze

MAX_YEAR_NUMBER = 150
CALENDAR_YEAR_INFO_MAP = {
  ko: KOREAN_LUNAR_YEAR_INFO
}.freeze

LUNARDAYS_FOR_MONTHTYPE = {
  1 => [29, 29, 0],
  2 => [30, 30, 0],
  3 => [58, 29, 29],
  4 => [59, 30, 29],
  5 => [59, 29, 30],
  6 => [60, 30, 30]
}.freeze

class Date
  def from_solar
    LunarDate.from_solar(year, month, day)
  end

  def to_solar(is_leap_month = false)
    LunarDate.to_solar(year, month, day, is_leap_month)
  end
end

class LunarDate
  attr_accessor :year, :month, :day, :is_leap_month

  @start_date = Date.new(1900, 1, 31)
  @calendar_symbol = :ko

  def initialize(year, month, day, is_leap_month = false)
    self.year = year
    self.month = month
    self.day = day
    self.is_leap_month = is_leap_month
  end

  def to_s
    format('%4d%02d%02d', year, month, day)
  end

  def inspect
    to_s
  end

  def self.lunardays_for_type(month_type)
    LUNARDAYS_FOR_MONTHTYPE[month_type]
  end

  def self.year_info_map
    CALENDAR_YEAR_INFO_MAP[@calendar_symbol]
  end

  def self.get_days(solar_date)
    (solar_date - @start_date).to_i
  end

  def self.from_solar(year, month, day)
    solar_date = Date.new(year, month, day)
    days = get_days(solar_date)
    lunar_from_days(days)
  end

  def self.in_this_days?(days, left_days)
    (days - left_days) < 0
  end

  def self.not_in_this_days?(days, left_days)
    in_this_days?(days, left_days) == false
  end

  def self.lunar_from_days(days)
    start_year = 1900
    target_month = 0
    is_leap_month = false
    matched = false
    year_info = year_info_map

    MAX_YEAR_NUMBER.times do |year_idx|
      year_days = year_info[year_idx][0]
      if in_this_days?(days, year_days)
        12.times do |month_idx|
          total, normal, _leap = lunardays_for_type(year_info[year_idx][month_idx + 1])
          if in_this_days?(days, total)
            if not_in_this_days?(days, normal)
              days -= normal
              is_leap_month = true
            end

            matched = true
            break
          end

          days -= total
          target_month += 1
        end
      end

      break if matched

      days -= year_days
      start_year += 1
    end

    lunar_date = new(start_year, target_month + 1, days + 1, is_leap_month)

    lunar_date
  end

  def self.to_solar(year, month, day, is_leap_month = false)
    days = 0
    year_diff = year - 1900
    year_info = year_info_map

    year_diff.times do |year_idx|
      days += year_info[year_idx][0]
    end

    (month - 1).times do |month_idx|
      total, _normal, _leap = lunardays_for_type(year_info[year_diff][month_idx + 1])
      days += total
    end

    days += (day - 1)

    if is_leap_month && year_info[year_diff][month] > 2
      days += lunardays_for_type(year_info[year_diff][month])[1]
    end

    solar_date = @start_date + days

    solar_date
  end
end
