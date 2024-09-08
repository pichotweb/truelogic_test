require "test_helper"

module Lib

  class WeatherFileParserTest < ActiveSupport::TestCase

    def setup
      @filename = 'storage/app/w_data (1).txt'
    end

    test "should parse file correctly gathering only usefull data" do
      parser = Parsers::WeatherFileParser.new @filename
      assert_equal 30, parser.parsed_data.size, "The parsed data size didn't match"
    end

    test "should return day number with smallest temperature spread" do
      parser = Parsers::WeatherFileParser.new @filename
      assert_equal "14", parser.get_smallest_temperature_spread_day, "Returned wrong day"
    end
  end

end