require 'net/http'
require 'json'
require './api.rb'

# Get city's name
print "輸入城市英文名字 : "
name = gets.chomp

# Fetch weather data
uri = URI('http://api.openweathermap.org/data/2.5/weather?q=' + name + '&units=metric&lang=zh_tw' + @api_param)
json = Net::HTTP.get(uri)
data = JSON.parse(json)

# Output
puts name + "現在的天氣是" + data["weather"][0]["description"]
puts name + "現在的溫度是" + data["main"]["temp"].to_s + "℃"
