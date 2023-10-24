require 'httparty'
require 'json'

# open_weather_key = "MY_API_KEY"
# geo_tag_url = "http://api.openweathermap.org/geo/1.0/direct?q=San Francisco&appid=#{open_weather_key}"
# response = HTTParty.get(geo_tag_url)
# data = JSON.parse(response.body)
# lon = data[0]['lon']
# lat = data[0]['lat']
# weather_url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&units=imperial&appid=#{open_weather_key}"
# response = HTTParty.get(weather_url)
# data = JSON.parse(response.body)
# puts data["main"]["temp"]

module Rails
  module WeatherApi
    def GetCity(city_name)
      open_weather_key = "c87b0dc01668b35a327c2d6d02328b9b"
      geo_tag_url = "http://api.openweathermap.org/geo/1.0/direct?q=#{city_name}&appid=#{open_weather_key}"
      response = HTTParty.get(geo_tag_url)
      data = JSON.parse(response.body)
      return data[0]
    end

    def GetTemperature(lon, lat)
      open_weather_key = "c87b0dc01668b35a327c2d6d02328b9b"
      weather_url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&units=imperial&appid=#{open_weather_key}"
      response = HTTParty.get(weather_url)
      data = JSON.parse(response.body)
      return data["main"]["temp"]
    end
  end
end
