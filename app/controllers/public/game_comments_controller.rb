class Public::GameCommentsController < ApplicationController
  def new
  end

  def create
    @comment = current_user.game_comments.new(game_comment_params)
    @comment.save
    redirect_to game_path(@comment.game)
  end

  def update
  end

  def edit
  end

  def index
  end

  def show
  end

  def destroy
    @comment = GameComment.find(params[:id])
    @comment.destroy
  end

  private

  def game_comment_params
    params.require(:game_comment).permit(:title, :body, :rate, :game_id)
  end
end
