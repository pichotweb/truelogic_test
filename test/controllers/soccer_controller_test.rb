require "test_helper"

class SoccerControllerTest < ActionDispatch::IntegrationTest

  test "should render soccer results json" do
    get "/soccer/smallest_goals_difference_team"

    assert_response :success
    assert_pattern { JSON.parse(response.body).to_h.symbolize_keys => { 'data': String } }
  end

end
