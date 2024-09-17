require 'net/http'
require 'json'

def geocoding(city_name)
  uri = URI("http://api.openweathermap.org/geo/1.0/direct?q=#{city_name}&limit=1#{@api_param}")
  json = Net::HTTP.get(uri)
  data = JSON.parse(json)

  if data.nil? || data[0].nil?
    return nil, nil
  end

  return data[0]["lat"], data[0]["lon"]
end