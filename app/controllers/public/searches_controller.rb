class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "Game"
      @games = RakutenWebService::Books::Game.search(title: params[:word])
    else
      @devices = RakutenWebService::Books::Game.search(title: params[:word])
    end
  end
end
