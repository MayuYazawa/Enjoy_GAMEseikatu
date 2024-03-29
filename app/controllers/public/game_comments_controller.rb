class Public::GameCommentsController < ApplicationController
  def new
  end

  def create
    @game_comment = GameComment.new(game_comment_params)
    @game_comment.user_id = current_user.id
    if @game_comment.save
      redirect_to game_path(@game_comment.game)  , notice: "投稿しました。"
    else
      render :new
    end

  end

  def update
    @game_comment = GameComment.find(params[:id])
    if @game_comment.update(game_comment_params)
      redirect_to game_path(@game_comment.game.id)
    else
      render "edit"
    end
  end

  def edit
    @game_comment = GameComment.find(params[:id])
  end

  def index
    @game_comments = current_user.game_comments.page(params[:page]).per(10)
  end

  def show
    # @game = Game.find(params[:id])
    @game_comment = GameComment.find(params[:id])
    # @game_comment = GameComment.new
    @game_genres = GameGenre.all
      if params[:game_genre_id].present?
        @game_genre = GameGenre.find(params[:game_genre_id])
        @games = @game_genre.page(params[:page]).per(8)
      end
    @game_comment_lists = @game_comment_details
  end

  def destroy
    @game_comment = GameComment.find(params[:id])
    @game_comment.destroy
    redirect_to game_path(@game_comment.game.id)
  end

  private

  def game_comment_params
    params.require(:game_comment).permit(:title, :body, :rate, :game_id)
  end
end
