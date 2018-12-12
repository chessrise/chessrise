# CLEANING RECORDS

p "Destroying all comments"
Comment.destroy_all
p "Destroying all plies"
Ply.destroy_all
p "Destroying all tags"
Tag.destroy_all
p "Destroying all games"
Game.destroy_all
p "Destroying all players"
Player.destroy_all
p "Destroying all collections"
Collection.destroy_all
p "Destroying all users"
User.destroy_all


# CREATING RECORDS

p "Creating records"

user1 = User.create!(email: "jcharlesfabre@gmail.com", password: "password")


ImportGamesFromPGNService.new("db/fixtures/wcc18_games.pgn",user1, "Carlsen - Caruana" ).call
ImportGamesFromPGNService.new("db/fixtures/kasparov_games.pgn",user1, "Parties Kasparov" ).call
ImportGamesFromPGNService.new("db/fixtures/miniatures_games.pgn",user1).call
ImportGamesFromPGNService.new("db/fixtures/sicilian_khan_games.pgn",user1).call
# ImportGamesFromPGNService.new("db/fixtures/my_games.pgn",user1, "Mes parties").call





