class Public::GameCommentGoodsController < ApplicationController

  def create
    game_comment = GameComment.find(params[:game_comment_id])
    game_comment_good = current_user.game_comment_goods.new(game_comment_id: game_comment.id)
    game_comment_good.save
    redirect_to game_comments_path
  end

  def destroy
    game_comment = GameComment.find(params[:game_comment_id])
    game_comment_good = current_user.game_comment_goods.find_by(game_comment_id: game_comment.id)
    game_comment_good.destroy
    redirect_to game_comments_path
  end
end
