require "test_helper"

class Admin::RegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_registration_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_registration_edit_url
    assert_response :success
  end
end
