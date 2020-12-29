require "test_helper"

class CompletedControllerTest < ActionDispatch::IntegrationTest
  test "should get complete" do
    get completed_complete_url
    assert_response :success
  end
end
