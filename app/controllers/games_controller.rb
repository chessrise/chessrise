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
    @collection = Collection.find(params[:collection_id])
    moves = params["movesArray"]
    white_player_first_name = params["white_player_first_name"]
    white_player_last_name = params["white_player_last_name"]
    black_player_first_name = params["black_player_first_name"]
    black_player_last_name = params["black_player_last_name"]
    result = params["result"]


    if Player.exists?(last_name: white_player_last_name, first_name: white_player_first_name)
      p "white player #{white_player_first_name} #{white_player_last_name} already in DB. Linking Player ID!"
      white_player = Player.find_by(
                                    first_name: white_player_first_name,
                                    last_name: white_player_last_name
                                  )
    else
      p "white player #{white_player_first_name} #{white_player_last_name} not in DB. Creating Player!"
      white_player = Player.create!(
                                  first_name: white_player_first_name,
                                  last_name: white_player_last_name
                                )
    end
    if Player.exists?(last_name: black_player_last_name, first_name: black_player_first_name)
      p "black player #{black_player_first_name} #{black_player_last_name} already in DB. Linking Player ID!"
      black_player = Player.find_by(
                                    first_name: black_player_first_name,
                                    last_name: black_player_last_name
                                  )
    else
      p "black player #{black_player_first_name} #{black_player_last_name} not in DB. Creating Player!"
      black_player = Player.create!(
                                first_name: black_player_first_name,
                                last_name: black_player_last_name
                              )
    end
    @game = Game.create!(white_player: white_player,
                          black_player: black_player,
                          result: result)

    if moves.present?
      moves.each_with_index do |move, index|
        Ply.create!(
                    game: @game,
                    ply_count: index + 1,
                    move: move,
                    status: "main",
                    # fen: pgn_game.fen_list[index]
                  )
      end
    end
    @game.save
    Tag.create!(game: @game, collection: @collection)

    @games = @collection.games

    respond_to do |format|
      format.html { redirect_to collections_path }
      format.js
    end

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

  def chessbox_search
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html { redirect_to collections_path }
      format.js
    end
  end

  def search
    @collections = Collection.all
    @collection = Collection.find(1)
    @search_fen = params[:search_fen] || "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"
    if params[:moves].present?
      @moves_string = params[:moves]
      @moves = @moves_string.split(",")
    end
    if @search_fen.present?
      @games = Ply.where("fen ILIKE ?", "#{@search_fen}%").includes(:game).map do |ply|
        [ply.game, ply.ply_count]
      end
    else
      @games = Game.all
    end
  end

  def searchable_fen(fen)
    if /(\s(w|b)\s)\K.+/.match(fen)
      fen.gsub(/(\s(w|b)\s)\K.+/.match(fen)[0], "")
    end
  end

  def search_by_fen
    @search_fen = searchable_fen(params["fen"])
    @moves = params["moves"]
    @path = search_url(search_fen: @search_fen, moves: @moves)
    respond_to do |format|
      format.html { redirect_to collections_path }
      format.js
    end
  end

  def newgame
    @collection = Collection.find(params[:id])
    respond_to do |format|
      format.html { redirect_to collections_path }
      format.js
    end
  end

  private

  def calculate_eco
    #recalculate eco_code
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
