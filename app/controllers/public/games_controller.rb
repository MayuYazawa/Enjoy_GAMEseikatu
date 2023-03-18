class Public::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(8)
    @game_genres = GameGenre.all
      if params[:game_genre_id].present?
        @game_genre = GameGenre.find(params[:game_genre_id])
        @games = @game_genre.games.page(params[:page]).per(8)
      end
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
    @game_genres = GameGenre.all
      if params[:game_genre_id].present?
        @game_genre = GameGenre.find(params[:game_genre_id])
        @games = @game_genre.page(params[:page]).per(8)
      end
  end

  def new
    @game = Game.new
    if params[:jan].present?
      @rakuten = RakutenWebService::Books::Game.search(jan: params[:jan])
    end
    @game_genre = GameGenre.all
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game.id)
    else
      render "edit"
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  def create
    if params[:jan].present?
      @rakuten = RakutenWebService::Books::Game.search(jan: params[:jan])
      @rakuten.each do |r|
        @game = Game.new
        @game.game_image = r['largeImageUrl']
        @game.game_genre = GameGenre.first
        @game.game_name  = r['title']
        @game.game_caption = r['itemCaption']
        @game.price = r['itemPrice']
        @game.system = r['hardware']
        @game.release = r['salesDate']
        @game.development = r['label']
        @game.user = current_user
        if @game.save!
          redirect_to games_path, notice: "投稿しました。"
        else
          render :new
        end
      end
      return
    end
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
      redirect_to games_path, notice: "投稿しました。"
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  private
  def game_params
    params.require(:game).permit(:game_genre_id, :game_name, :game_caption, :price, :system, :release, :development)
  end
end
