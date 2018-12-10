class ImportGamesFromPGNService
  def initialize(pgn_file_path, collection_name, user)
    @pgn_file_path = pgn_file_path
    @collection = Collection.create!(name: collection_name, user: user)
  end

  def call
    p "parsing games from PGN"
    pgn_games = PGN.parse(File.read(@pgn_file_path))

    pgn_games.each do |pgn_game|

      begin
          white_player_first_name = pgn_game.tags["White"].split(",")[1].strip
          white_player_last_name = pgn_game.tags["White"].split(",")[0].strip

          black_player_first_name = pgn_game.tags["Black"].split(",")[1].strip
          black_player_last_name = pgn_game.tags["Black"].split(",")[0].strip

          p "creating Players from PGN"

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

          p "creating Game"

          game = Game.create!(

            result: pgn_game.result,
            event: pgn_game.tags["Event"],
            site: pgn_game.tags["Site"],
            date: pgn_game.tags["Date"],
            round: pgn_game.tags["Round"],
            eco_code: pgn_game.tags["ECO"],
            initial_position: pgn_game.fen_list.first,
            elo_white: pgn_game.tags["WhiteElo"],
            elo_black: pgn_game.tags["BlackElo"],
            white_player: white_player,
            black_player: black_player,
            ply_count_total: pgn_game.positions.last.halfmove

          )

          p "created game : #{game.white_player.last_name} vs #{game.black_player.last_name} - Result: #{game.result} "

          p "creating Plies from Game"
          pgn_game.moves.each_with_index do |kingbase_ply, index|
            Ply.create!(
                        game: game,
                        ply_count: index + 1,
                        move: kingbase_ply.notation,
                        status: "main",
                        fen: pgn_game.fen_list[index]
                      )
          end
          p "number of Plies in Game: #{Ply.last.ply_count}"
          p "______________________________________________"


        p "creating tags"
          Tag.create!(game: game, collection: @collection)



      rescue
        next

      end


    end

  end

end


