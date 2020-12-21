require 'test_helper'

class TodonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todone = todones(:one)
  end

  test "should get index" do
    get todones_url, as: :json
    assert_response :success
  end

  test "should create todone" do
    assert_difference('Todone.count') do
      post todones_url, params: { todone: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show todone" do
    get todone_url(@todone), as: :json
    assert_response :success
  end

  test "should update todone" do
    patch todone_url(@todone), params: { todone: {  } }, as: :json
    assert_response 200
  end

  test "should destroy todone" do
    assert_difference('Todone.count', -1) do
      delete todone_url(@todone), as: :json
    end

    assert_response 204
  end
end
