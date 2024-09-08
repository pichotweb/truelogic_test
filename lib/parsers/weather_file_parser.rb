module Parsers
  class WeatherFileParser < Parsers::FileParser
    def parse
      raise FileFileNotFoundError unless File.exist?(@file)

      File.open(@file).map do |line|
        parsed_line = line.scan(/(\w+)/).flatten

        # As long we are using 3 first columns, we can use this approach for simplicity, if we do need the blank column we should map each data position individually
        next if parsed_line.size < 19

        [ parsed_line[0], parsed_line[1], parsed_line[2] ]
      end.compact
    end

    def get_smallest_temperature_spread_day
      day_number = nil
      smallest_temperature_spread = nil

      @parsed_data.each do |data|
        # After parsed the data is available at following indexes:
        # 0 - Day of the month
        # 1 - Maximum temp
        # 2 - Minimum temp
        temperature_spread = (data[1].to_i - data[2].to_i)

        # Sets the smallest difference for the first positioned team, as long they all can have negatives differences
        day_number, smallest_temperature_spread = data[0], temperature_spread if smallest_temperature_spread.nil? || smallest_temperature_spread > temperature_spread&.to_i
      end

      day_number
    end
  end
end
