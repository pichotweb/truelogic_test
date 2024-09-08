require "test_helper"

module Lib

  class SoccerFileParserTest < ActiveSupport::TestCase

    def setup
      @filename = 'storage/app/soccer (1).txt'
    end

    test "should parse file correctly gathering only usefull data" do
      parser = Parsers::SoccerFileParser.new @filename
      assert_equal 20, parser.parsed_data.size, "The parsed data size didn't match"
    end

    test "should return team name with smallest goal difference" do
      parser = Parsers::SoccerFileParser.new @filename
      assert_equal 'Leicester', parser.get_smallest_goals_difference_team, "Returned wrong team name with smallest goal difference"
    end
  end

end