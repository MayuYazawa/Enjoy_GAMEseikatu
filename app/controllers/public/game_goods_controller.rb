class Public::GameGoodsController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    game_good = current_user.game_goods.new(game_id: game.id)
    game_good.save
    redirect_to game_path(params[:game_id])
  end

  def destroy
    game = Game.find(params[:game_id])
    game_good = current_user.game_goods.find_by(game_id: game.id)
    game_good.destroy
    redirect_to game_path(params[:game_id])
  end
end
