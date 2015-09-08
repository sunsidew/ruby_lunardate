# ruby_lunardate [![Gem Version](https://badge.fury.io/rb/ruby_lunardate.svg)](http://badge.fury.io/rb/ruby_lunardate)

## install
```shell
gem install ruby_lunardate
```

## how-to-use
```ruby
require 'ruby_lunardate'
d = LunarDate.to_lunar(2015,9,8)
puts d # 20150726
```

or simply use to_lunar method by Date Class
```ruby
require 'ruby_lunardate'
date = Date.new(2015,9,8)
puts date.to_lunar # 2015-07-26
```
