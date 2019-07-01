require 'test_helper'

class BasePointsPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get base_points" do
    get base_points_pages_base_points_url
    assert_response :success
  end

end
