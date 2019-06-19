require 'test_helper'

class TameshiPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get tameshi" do
    get tameshi_pages_tameshi_url
    assert_response :success
  end

end
