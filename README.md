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
d = LunarDate.from_solar(2015,9,8)
puts d
# => 20150726

# from lunar to solar
d2 = LunarDate.to_solar(2015,7,26)
puts d2
# => 20150908
```
or simply use to_lunar method by Date Class
```ruby
require 'ruby_lunardate'

# from solar to lunar
date = Date.new(2015,9,8)
puts date.from_solar
# => 2015-07-26

# from lunar to solar
date2 = Date.new(2015,7,26)
puts date2.to_solar
# => 2015-09-08
```
