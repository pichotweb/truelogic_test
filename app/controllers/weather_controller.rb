class WeatherController < ApplicationController
  def smallest_temperature_spread_day
    parser = Parsers::WeatherFileParser.new "storage/app/w_data (1).txt"
    render json: { data: parser.get_smallest_temperature_spread_day }
  end
end
