class Admin::GameGenresController < ApplicationController
  def index
    @game_genre = GameGenre.new
    @game_genres = GameGenre.all
  end

  def create
    @game_genre = GameGenre.new(game_genre_params)
    if @game_genre.save
      redirect_to request.referer, notice: "ジャンルを追加しました。"
    else
      @game_genres = GameGenre.all
      render 'index'
    end
  end

  def edit
    @game_genre = GameGenre.find(params[:id])
  end

  def update
    game_genre = GameGenre.find(params[:id])
    if game_genre.update(game_genre_params)
      redirect_to admin_game_genres_path
    else
      @game_genre = GameGenre.find(params[:id])
      @game_genre.update(game_genre_params)
      render "edit"
    end
  end

  def destroy
    @game_genre = GameGenre.find(params[:id])
    @game_genre.destroy
    redirect_to admin_game_genres_path
  end

  private

  def game_genre_params
    params.require(:game_genre).permit(:game_genre_name)
  end
end
