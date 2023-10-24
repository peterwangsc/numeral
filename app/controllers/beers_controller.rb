require 'httparty'
require 'json'

class BeersController < ApplicationController
  module WeatherApi
    def self.GetCity(city_name)
      open_weather_key = "c87b0dc01668b35a327c2d6d02328b9b"
      geo_tag_url = "http://api.openweathermap.org/geo/1.0/direct?q=#{city_name}&appid=#{open_weather_key}"
      response = HTTParty.get(geo_tag_url)
      data = JSON.parse(response.body)
      return data[0]
    end

    def self.GetTemperature(lon, lat)
      open_weather_key = "c87b0dc01668b35a327c2d6d02328b9b"
      weather_url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&units=imperial&appid=#{open_weather_key}"
      response = HTTParty.get(weather_url)
      data = JSON.parse(response.body)
      return data["main"]["temp"]
    end
  end
  def index
    city_name = params[:city_name]
    city = City.where(name: city_name)
    if (city.first)
      @c = city.first
    else
      data = WeatherApi::GetCity(city_name)
      @c = City.new
      @c.name = city_name
      @c.lon = data["lon"]
      @c.lat = data["lat"]
      @temp = WeatherApi::GetTemperature(data["lon"], data["lat"])
      @c.temp = @temp
      @c.save
    end
    @c
  end

  def show
    @beer = City.find(params[:id])
  end

  def destroy
    city_name = params[:city_name]
  end
end
