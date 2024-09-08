class SoccerController < ApplicationController
  
  def smallest_goals_difference_team
    parser = Parsers::SoccerFileParser.new 'storage/app/soccer (1).txt'
    render json: {data: parser.get_smallest_goals_difference_team}
  end
  
end
