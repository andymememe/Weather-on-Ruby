require 'net/http'
require 'json'
require './api.rb'

# Get city's name
print "輸入城市英文名字 : "
name = gets.chomp

puts ""
puts "==============================="
puts "自OpenWeatherMap下載中...請稍候"
puts "==============================="
puts ""

# Fetch weather data
uri = URI('http://api.openweathermap.org/data/2.5/forecast/daily?q=' + name + '&units=metric&lang=zh_tw&cnt=7' + @api_param)
json = Net::HTTP.get(uri)
data = JSON.parse(json)
i = 1

# Output
if data["cod"] == "200" then
	name = data["city"]["name"]
	data["list"].each do |day|
		puts "== " + Time.at(day["dt"]).strftime("%F %R %:z") + " =="
		puts name + "的天氣為" + day["weather"][0]["description"]
		puts name + "的早晨溫度為" + day["temp"]["morn"].to_s + "℃"
		puts name + "的白天溫度為" + day["temp"]["day"].to_s + "℃"
		puts name + "的傍晚溫度為" + day["temp"]["eve"].to_s + "℃"
		puts name + "的夜晚溫度為" + day["temp"]["night"].to_s + "℃"
		puts name + "最低最高溫為" + day["temp"]["min"].to_s + "℃  ~ " + day["temp"]["max"].to_s + "℃"
		puts name + "的雲量為" + day["clouds"].to_s + "%"
		puts name + "的風速為" + day["speed"].to_s + "公尺/秒"
		puts name + "的濕度為" + day["humidity"].to_s + "%"
		puts name + "的氣壓為" + day["pressure"].to_s + "hPa"
		puts ""
		i = i + 1
	end
else
	puts data["cod"] + " - " + data["message"]
end

puts "資料來自於OpenWeatherMap : http://openweathermap.org/"
puts ""
