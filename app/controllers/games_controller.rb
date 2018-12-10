class GamesController < ApplicationController
  before_action :calculate_eco, only: [:update, :create]
  before_action :set_game, only: [:show, :edit, :udpate, :destroy]

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

  def new
    @game = Game.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def chessbox
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html { redirect_to collections_path }
      format.js
    end
  end

  def search_by_fen
    search_fen = Ply.find(params[:id]).searchable_fen
    @games = Ply.where("fen ILIKE ?", "#{search_fen}%").includes(:game).map(&:game).uniq
  end

  private

  def calculate_eco
    #recalculate eco_code
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
