require 'net/http'
require 'json'
require 'api.rb'

print "輸入城市英文名字 : "
name = gets
uri = URI('http://api.openweathermap.org/data/2.5/weather?q=' + name + '&units=metric&lang=zh_tw' + @api_param)
json = Net::HTTP.get(uri)
data = JSON.parse(json)
puts "現在的天氣是" + data["weather"][0]["description"]
puts "現在的溫度是" + data["main"]["temp"].to_s + "℃"
