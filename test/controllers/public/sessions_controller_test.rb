require "test_helper"

class Public::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get public_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_sessions_destroy_url
    assert_response :success
  end
end
