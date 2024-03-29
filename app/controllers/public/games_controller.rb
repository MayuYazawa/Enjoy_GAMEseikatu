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
    if params[:jan].present?
      @rakuten = RakutenWebService::Books::Game.search(jan: params[:jan])
      @rakuten.each do |r|
        @game = Game.new
        @game.game_image = r['largeImageUrl']
        @game.game_name  = r['title']
        @game.game_caption = r['itemCaption']
        @game.price = r['itemPrice']
        @game.system = r['hardware']
        str1 =  r['salesDate'].gsub("年", "#")
        str2 = str1.gsub("月", "#")
        str3 = str2.gsub("日", "#")
        arr = str3.split("#")
        @game.release =  Date.new(arr[0].to_i, arr[1].to_i, arr[2].to_i)
        @game.development = r['label']
      end
    else
      @game = Game.new
    end
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

    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save!
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
    params.require(:game).permit(:game_genre_id, :game_name, :game_caption, :price, :system, :development, :game_image)
    .merge(
      {release:
      "#{params[:game]["release(1i)"]}-#{params[:game]["release(2i)"]}-#{params[:game]["release(3i)"]}"
      }

    )
  end

end
