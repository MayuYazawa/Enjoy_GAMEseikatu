class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    elsif
      @games = Game.looks(params[:search], params[:word])
    else
      @devices = Game.looks(params[:search], params[:word])
    end
  end
end
