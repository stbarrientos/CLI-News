class Info < ActiveRecord::Base

  include HTTParty

  base_uri "api.openweathermap.org"

  def self.fetch(city)
    response = get('/data/2.5/weather/', query: {q: city, units: "imperial"}).parsed_response
    temp = response["main"]["temp"]
    weather = response["weather"][0]["description"]
    name = response["name"]
    art = "\\    /\\    /   |---    /\\  -----  |    |  |---  |--\\ \n \\  /  \\  /    |---   /--\\   |    |----|  |---  |--/ \n  \\/    \\/     |---  /    \\  |    |    |  |---  |   \\ \n"
    return "\n\n#{art}\n\nInfo for #{name}\nWeather: #{weather}\nTemperature: #{temp}\n"
  end

end
