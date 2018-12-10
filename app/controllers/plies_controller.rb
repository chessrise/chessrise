class PliesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @ply = Ply.new

    @game = Game.find(@ply.game_id)
    raise
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @ply = Ply.find(params[:id])
    @game = @ply.game
    # binding.pry
    raise
    @ply.destroy
    redirect_to game_path(@game)
  end
end
