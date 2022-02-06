require "test_helper"

class PustsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pusts_index_url
    assert_response :success
  end
end
