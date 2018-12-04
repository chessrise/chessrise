class GamesController < ApplicationController
  before_action :calculate_eco, only: [:update, :create]
  before_action :set_game, only: [:show, :edit, :udpate, :destroy]

  def create
  end

  def new
    @game = Game.new
  end

  def index
  end

  def show
    @plies = @game.plies
    @main_plies = @plies.where(status: "main")
    @variant_plies = @plies.where(status: "variant")
    @white_player = @game.white_player if @game.white_player.present?
    @black_player = @game.black_player if @game.black_player.present?
    @comment = Comment.new
  end

  def update
  end

  def edit

  end

  def destroy
  end

  private

  def calculate_eco
    #recalculate eco_code
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
