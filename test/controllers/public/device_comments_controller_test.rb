require "test_helper"

class Public::DeviceCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_device_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get public_device_comments_create_url
    assert_response :success
  end

  test "should get update" do
    get public_device_comments_update_url
    assert_response :success
  end

  test "should get edit" do
    get public_device_comments_edit_url
    assert_response :success
  end

  test "should get index" do
    get public_device_comments_index_url
    assert_response :success
  end

  test "should get show" do
    get public_device_comments_show_url
    assert_response :success
  end

  test "should get destroy" do
    get public_device_comments_destroy_url
    assert_response :success
  end
end