class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit]

  def index
  end

  def show
  end

  def edit
  end

  def new
    @player = Player.new
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end
end
