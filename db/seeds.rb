# CLEANING RECORDS

p "Destroying all comments"
Comment.destroy_all
p "Destroying all plies"
Ply.destroy_all
p "Destroying all players"
Player.destroy_all
p "Destroying all games"
Game.destroy_all
p "Destroying all tags"
Tag.destroy_all
p "Destroying all collections"
Collection.destroy_all
p "Destroying all users"
User.destroy_all


# CREATING RECORDS

p "Creating records"

user1 = User.create!(email: "jcharlesfabre@gmail.com", password: "password")

# magnus = Player.create!(first_name: "Magnus", last_name: "Carlsen", title: "GM")
# fabiano = Player.create!(first_name: "Fabiano", last_name: "Caruana", title: "GM")

# collection1 = Collection.create!(name: "Sicilian", user: user1)
# collection2 = Collection.create!(name: "Favorites", user: user1)
# collection3 = Collection.create!(name: "Carlsen - Caruana", user: user1)
# collection4 = Collection.create!(name: "My games", user: user1)
# collection5 = Collection.create!(name: "Queen's Indian White", user: user1)
# collection6 = Collection.create!(name: "Beauty Prizes", user: user1)
# collection7 = Collection.create!(name: "Classics", user: user1)


# game1 = Game.create!(event: "World Chess Championship Match",
#                     site: "London",
#                     date: DateTime.new(2018,11,15,14),
#                     round: 12,
#                     result: "1/2 - 1/2",
#                     ply_count_total: 50,
#                     eco_code: "B33",
#                     initial_position: "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
#                     elo_white: 2832,
#                     elo_black: 2835,
#                     white_player: fabiano,
#                     black_player: magnus)

# p1 = Ply.create!(game: game1, ply_count: 1, parent: nil, move: "e4", status: "main")
# p2 = Ply.create!(game: game1, ply_count: 2, parent: p1, move: "c5", status: "main")
# p3 = Ply.create!(game: game1, ply_count: 3, parent: p2, move: "Nf3", status: "main")
# p4 = Ply.create!(game: game1, ply_count: 4, parent: p3, move: "Nc6", status: "main")
# p5 = Ply.create!(game: game1, ply_count: 5, parent: p4, move: "d4", status: "main")
# p6 = Ply.create!(game: game1, ply_count: 6, parent: p5, move: "cxd4", status: "main")
# p7 = Ply.create!(game: game1, ply_count: 7, parent: p6, move: "Nxd4", status: "main")
# p8 = Ply.create!(game: game1, ply_count: 8, parent: p7, move: "Nf6", status: "main")
# p9 = Ply.create!(game: game1, ply_count: 9, parent: p8, move: "Nc3", status: "main")
# p10 = Ply.create!(game: game1, ply_count: 10, parent: p9, move: "e5", status: "main")
# p11 = Ply.create!(game: game1, ply_count: 11, parent: p10, move: "Ndb5", status: "main")
# p12 = Ply.create!(game: game1, ply_count: 12, parent: p11, move: "d6", status: "main")
# p13 = Ply.create!(game: game1, ply_count: 13, parent: p12, move: "Nd5", status: "main")
# p14 = Ply.create!(game: game1, ply_count: 14, parent: p13, move: "Nxd5", status: "main")
# p15 = Ply.create!(game: game1, ply_count: 15, parent: p14, move: "exd5", status: "main")
# p16 = Ply.create!(game: game1, ply_count: 16, parent: p15, move: "Ne7", status: "main")
# p17 = Ply.create!(game: game1, ply_count: 17, parent: p16, move: "c4", status: "main")
# p18 = Ply.create!(game: game1, ply_count: 18, parent: p17, move: "Ng6", status: "main")
# p19 = Ply.create!(game: game1, ply_count: 19, parent: p18, move: "Qa4", status: "main")

# p26 = Ply.create!(game: game1, ply_count: 4, parent: p3, move: "e6", status: "variant")
# p27 = Ply.create!(game: game1, ply_count: 5, parent: p26, move: "d4", status: "variant")
# p28 = Ply.create!(game: game1, ply_count: 6, parent: p27, move: "cxd4", status: "variant")
# p28 = Ply.create!(game: game1, ply_count: 6, parent: p27, move: "Qxd4", status: "variant")


# comment1 = Comment.create!(commenter: "JC", ply: p10, content: "Another Schevnichov")
# comment2 = Comment.create!(commenter: "JC", ply: p19, content: "The game continued but it ended in a draw")


# game2 = Game.create!(result: "1 - 0",
#                     ply_count_total: 7,
#                     initial_position: "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
#                     name: "Coup du berger")

# p1 = Ply.create!(game: game2, ply_count: 1, parent: nil, move: "e4", status: "main")
# p2 = Ply.create!(game: game2, ply_count: 2, parent: p1, move: "e5", status: "main")
# p3 = Ply.create!(game: game2, ply_count: 3, parent: p2, move: "Bc4", status: "main")
# p4 = Ply.create!(game: game2, ply_count: 4, parent: p3, move: "a6", status: "main")
# p5 = Ply.create!(game: game2, ply_count: 5, parent: p4, move: "Qh5", status: "main")
# p6 = Ply.create!(game: game2, ply_count: 6, parent: p5, move: "Nf6", status: "main")
# p7 = Ply.create!(game: game2, ply_count: 7, parent: p6, move: "Qxf7", status: "main")

# tag1 = Tag.create!(game: game1, collection: collection1)
# tag2 = Tag.create!(game: game1, collection: collection2)
# tag3 = Tag.create!(game: game1, collection: collection3)
# tag4 = Tag.create!(game: game2, collection: collection7)


# game2 = Game.create!(event: "World Chess Championship Match",
#                     site: "London",
#                     date: DateTime.new(2018,11,15,14),
#                     round: 1,
#                     result: "1/2 - 1/2",
#                     ply_count_total: 50,
#                     eco_code: "B33",
#                     initial_position: "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
#                     elo_white: 2832,
#                     elo_black: 2835,
#                     white_player: magnus,
#                     black_player: fabiano)

# game3 = Game.create!(event: "World Chess Championship Match",
#                     site: "London",
#                     date: DateTime.new(2018,11,15,14),
#                     round: 2,
#                     result: "1/2 - 1/2",
#                     ply_count_total: 50,
#                     eco_code: "B33",
#                     initial_position: "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
#                     elo_white: 2832,
#                     elo_black: 2835,
#                     white_player: fabiano,
#                     black_player: magnus)



# CREATING LOTS OF GAMES FROM KINGBASE
# you can find the file code in db/fixtures
# you can find the code in app/services
# ImportGamesFromPGNService.new("db/fixtures/KingBase.pgn").call



ImportGamesFromPGNService.new("db/fixtures/wcc18_games.pgn","Carlsen - Caruana WCC 18", user1 ).call
ImportGamesFromPGNService.new("db/fixtures/kasparov_games.pgn","Kasparov Games", user1 ).call
ImportGamesFromPGNService.new("db/fixtures/miniatures_games.pgn","Miniatures", user1 ).call
ImportGamesFromPGNService.new("db/fixtures/sicilian_khan_games.pgn","Sicilian Khan Black", user1 ).call
ImportGamesFromPGNService.new("db/fixtures/my_games.pgn","My games", user1 ).call



