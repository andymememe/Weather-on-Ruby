require 'net/http'
require 'json'
require './api.rb'
require './geocoding.rb'

# Get city's name
print '輸入城市英文名字 : '
name = gets.chomp
lat, lon = geocoding(name)

if lat.nil?
    puts "未知城市: #{name}"
    exit
end

puts ''
puts '==============================='
puts '自OpenWeatherMap下載中...請稍候'
puts '==============================='
puts ''

# Fetch weather data
uri = URI("http://api.openweathermap.org/data/2.5/forecast?lat=#{lat}&lon=#{lon}&units=metric&lang=zh_tw&cnt=9#{@api_param}")
json = Net::HTTP.get(uri)
data = JSON.parse(json)
i = 1

# Output
if data['cod'] == '200'
    name = data['city']['name']
    data['list'].each do |day|
        puts '== ' + Time.at(day['dt']).strftime('%F %R %:z') + ' =='
        puts name + '的天氣為' + day['weather'][0]['description']
        puts name + '的溫度為' + day['main']['temp'].to_s + '℃'
        puts name + '最低最高溫為' + day['main']['temp_min'].to_s + '℃  ~ ' + day['main']['temp_max'].to_s + '℃'
        puts name + '的雲量為' + day['clouds']['all'].to_s + '%'
        puts name + '的風速為' + day['wind']['speed'].to_s + '公尺/秒'
        puts name + '的濕度為' + day['main']['humidity'].to_s + '%'
        puts name + '的氣壓為' + day['main']['pressure'].to_s + 'hPa'
        puts ''
        i += 1
    end
else
    puts "#{data['cod']} - #{data['message']}"
end

puts '資料來自於OpenWeatherMap : http://openweathermap.org/'
puts ''
