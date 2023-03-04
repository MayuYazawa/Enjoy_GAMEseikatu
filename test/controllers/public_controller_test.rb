require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get homes" do
    get public_homes_url
    assert_response :success
  end

  test "should get top" do
    get public_top_url
    assert_response :success
  end

  test "should get about" do
    get public_about_url
    assert_response :success
  end
end
