require "test_helper"

class WeatherControllerTest < ActionDispatch::IntegrationTest
  
  test "should render weather result day as json" do
    get "/weather/smallest_temperature_spread_day"

    assert_response :success
    assert_pattern { JSON.parse(response.body).to_h.symbolize_keys => { 'data': String } }
  end

end
