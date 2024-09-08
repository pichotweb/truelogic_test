module Parsers
  class SoccerFileParser < Parsers::FileParser
    def parse
      raise FileFileNotFoundError unless File.exist?(@file)

      File.open(@file).map do |line|
        parsed_line = line.scan(/(\w+)/).flatten

        # Data rows contains exactly 9 items, anything lesser than this we
        # can skip to clean headers and formatting from parsed array.
        next if parsed_line.size < 9

        parsed_line
      end.compact
    end

    def get_smallest_goals_difference_team
      smallest_goals_difference = nil
      smallest_goals_difference_team = ""

      @parsed_data.each do |data|
        # After parsed the data is available at following indexes:
        # 0 - Team position
        # 1 - Team name
        # 2 - Match count
        # 3 - win count
        # 4 - lose count
        # 5 - draw count
        # 6 - goals for
        # 7 - goals against
        # 8 - points
        goals_difference = (data[6].to_i - data[7].to_i)

        # Sets the smallest difference for the first positioned team, as long they all can have negatives differences
        smallest_goals_difference, smallest_goals_difference_team = goals_difference, data[1] if smallest_goals_difference.nil? || (goals_difference < smallest_goals_difference)
      end

      smallest_goals_difference_team
    end
  end
end
