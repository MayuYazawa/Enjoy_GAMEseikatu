class Admin::GameCommentsController < ApplicationController
before_action :authenticate_admin!

  def index
    @game_comments = GameComment.page(params[:page]).per(10).order(created_at: "DESC")
  end

  def current_user_game_comment
    @game_comments = GameComment.where(user_id: params[:id])
  end

  def show
    @game_comments = GameComment.where(user_id: params[:id])
  end

  def update
    @game_comment = GameComment.find(params[:id])
    @game_comment_details = GameCommentDetail.where(game_comment_id: params[:id])
    if @game_comment.update(game_comment_params)
    end
    redirect_to admin_game_comment_path(@game_comment)
  end

  def destroy
    game_comment = GameComment.find(params[:id])
    game_comment.destroy
    @game_comments = GameComment.all
    redirect_to admin_game_comments_path
  end

  private

  def game_comment_params
    params.require(:game_comment).permit(:rate)
  end
end
