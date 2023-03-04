require "test_helper"

class Public::GameCommentGoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_game_comment_goods_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_game_comment_goods_destroy_url
    assert_response :success
  end
end
