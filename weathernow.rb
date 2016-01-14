require 'net/http'
require 'json'
require './api.rb'
# require './uvhelper.rb'

# Get city's name
print "輸入城市英文名字 : "
name = gets.chomp

puts ""
puts "==============================="
puts "自OpenWeatherMap下載中...請稍候"
puts "==============================="
puts ""

# Fetch weather data
uri = URI('http://api.openweathermap.org/data/2.5/weather?q=' + name + '&units=metric&lang=zh_tw' + @api_param)
json = Net::HTTP.get(uri)
weather = JSON.parse(json)

if weather["cod"] == 200 then
	# # Fetch UV data
	# uri = URI('http://api.owm.io/air/1.0/uvi/current?lat=' +  weather["coord"]["lat"].to_s + '&lon=' + weather["coord"]["lon"].to_s + @api_param)
	# json = Net::HTTP.get(uri)
	# uv = JSON.parse(json)
	# if uv["value"] != nil then
	# 	uvresult = uv_helper(uv["value"])
	# end

	# Output
	name = weather["name"]
	puts "本資料之時間為" + Time.at(weather["dt"]).strftime("%F %R %:z")
	puts name + "的天氣為" + weather["weather"][0]["description"]
	puts name + "的溫度為" + weather["main"]["temp"].to_s + "℃"
	puts name + "最低最高溫為" + weather["main"]["temp_min"].to_s + "℃  ~ " + weather["main"]["temp_max"].to_s + "℃"
	puts name + "下個日出時間為" + Time.at(weather["sys"]["sunrise"]).strftime("%F %R %:z") + "，下個日落時間為" + Time.at(weather["sys"]["sunset"]).strftime("%F %R %:z")
	puts name + "的雲量為" + weather["clouds"]["all"].to_s + "%"
	puts name + "的風速為" + weather["wind"]["speed"].to_s + "公尺/秒"
	puts name + "的濕度為" + weather["main"]["humidity"].to_s + "%"
	puts name + "的氣壓為" + weather["main"]["pressure"].to_s + "hPa"
	# if uv["value"] != nil then
	# 	puts name + "現在UV指數為" + uv["value"].to_s + "，對於一般成人的危險值為" + uvresult["level"]
	# 	puts "抗UV小建議 : " + uvresult["msg"]
	# end
	puts ""
	puts "資料來自於OpenWeatherMap : http://openweathermap.org/"
	puts ""
else
	puts weather["cod"].to_s + " - " + weather["message"]
end
