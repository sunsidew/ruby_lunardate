# ruby_lunardate [![Gem Version](https://badge.fury.io/rb/ruby_lunardate.svg)](http://badge.fury.io/rb/ruby_lunardate)
Korean Lunar/Solar Calendar Library

## install
```shell
gem install ruby_lunardate
```

## how-to-use
```ruby
require 'ruby_lunardate'

# from solar to lunar
lun_date = LunarDate.from_solar(2015,9,8)
puts lun_date #=> #<LunarDate: ...>
# => 20150726

# from lunar to solar
sol_date = LunarDate.to_solar(2015,7,26)
puts sol_date #=> #<Date: ...>
# => 2015-09-08
```
or simply use to_lunar method by Date Class
```ruby
require 'ruby_lunardate'

# from solar to lunar
lun_date = Date.new(2015,9,8)
puts lun_date.from_solar #=> #<LunarDate: ...>
# => 20150726

# from lunar to solar
sol_date = Date.new(2015,7,26)
puts sol_date.to_solar #=> #<Date: ...>
# => 2015-09-08
```
