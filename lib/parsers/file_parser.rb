module Parsers
  class FileParser
    attr_reader :parsed_data

    def initialize(file)
      @file = file
      @parsed_data = self.parse
    end

    def parse
      raise FileFileNotFoundError unless File.exist?(@file)
      File.open(@file).map { |line| line.scan(/(\w+)/).flatten }.compact
    end
  end
end
