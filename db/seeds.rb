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

magnus = Player.create!(first_name: "Magnus", last_name: "Carlsen", title: "GM")
fabiano = Player.create!(first_name: "Fabiano", last_name: "Caruana", title: "GM")

collection1 = Collection.create!(name: "Sicilian", user: user1)
collection2 = Collection.create!(name: "Favorites", user: user1)
collection3 = Collection.create!(name: "Carlsen - Caruana", user: user1)
collection4 = Collection.create!(name: "My games", user: user1)
collection5 = Collection.create!(name: "Queen's Indian White", user: user1)
collection6 = Collection.create!(name: "Beauty Prizes", user: user1)
collection7 = Collection.create!(name: "Classics", user: user1)


game1 = Game.create!(event: "World Chess Championship Match",
                    site: "London",
                    date: DateTime.new(2018,11,15,14),
                    round: 12,
                    result: "1/2 - 1/2",
                    ply_count_total: 50,
                    eco_code: "B33",
                    initial_position: "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
                    elo_white: 2832,
                    elo_black: 2835,
                    white_player: fabiano,
                    black_player: magnus)

p1 = Ply.create!(game: game1, ply_count: 1, parent: nil, move: "e4", status: "main")
p2 = Ply.create!(game: game1, ply_count: 2, parent: p1, move: "c5", status: "main")
p3 = Ply.create!(game: game1, ply_count: 3, parent: p2, move: "Cf3", status: "main")
p4 = Ply.create!(game: game1, ply_count: 4, parent: p3, move: "Cc6", status: "main")
p5 = Ply.create!(game: game1, ply_count: 5, parent: p4, move: "d4", status: "main")
p6 = Ply.create!(game: game1, ply_count: 6, parent: p5, move: "cxd4", status: "main")
p7 = Ply.create!(game: game1, ply_count: 7, parent: p6, move: "Cxd4", status: "main")
p8 = Ply.create!(game: game1, ply_count: 8, parent: p7, move: "Cf6", status: "main")
p9 = Ply.create!(game: game1, ply_count: 9, parent: p8, move: "Cc3", status: "main")
p10 = Ply.create!(game: game1, ply_count: 10, parent: p9, move: "e5", status: "main")
p11 = Ply.create!(game: game1, ply_count: 11, parent: p10, move: "Cdb5", status: "main")
p12 = Ply.create!(game: game1, ply_count: 12, parent: p11, move: "d6", status: "main")
p13 = Ply.create!(game: game1, ply_count: 13, parent: p12, move: "Cd5", status: "main")
p14 = Ply.create!(game: game1, ply_count: 14, parent: p13, move: "Cxd5", status: "main")
p15 = Ply.create!(game: game1, ply_count: 15, parent: p14, move: "exd5", status: "main")
p16 = Ply.create!(game: game1, ply_count: 16, parent: p15, move: "Ce7", status: "main")
p17 = Ply.create!(game: game1, ply_count: 17, parent: p16, move: "c4", status: "main")
p18 = Ply.create!(game: game1, ply_count: 18, parent: p17, move: "Cg6", status: "main")
p19 = Ply.create!(game: game1, ply_count: 19, parent: p18, move: "Da4", status: "main")
p20 = Ply.create!(game: game1, ply_count: 20, parent: p19, move: "Fb7", status: "main")
p21 = Ply.create!(game: game1, ply_count: 21, parent: p20, move: "Db4", status: "main")
p22 = Ply.create!(game: game1, ply_count: 22, parent: p21, move: "Ff5", status: "main")
p23 = Ply.create!(game: game1, ply_count: 23, parent: p22, move: "h4", status: "main")
p24 = Ply.create!(game: game1, ply_count: 24, parent: p23, move: "h5", status: "main")
p25 = Ply.create!(game: game1, ply_count: 25, parent: p24, move: "Da4", status: "main")

p26 = Ply.create!(game: game1, ply_count: 4, parent: p3, move: "e6", status: "variant")
p27 = Ply.create!(game: game1, ply_count: 5, parent: p26, move: "d4", status: "variant")
p28 = Ply.create!(game: game1, ply_count: 6, parent: p27, move: "cxd4", status: "variant")
p28 = Ply.create!(game: game1, ply_count: 6, parent: p27, move: "Dxd4", status: "variant")


comment1 = Comment.create!(commenter: "JC", ply: p10, content: "Another Schevnichov")
comment2 = Comment.create!(commenter: "JC", ply: p25, content: "The game continued but it ended in a draw")


game2 = Game.create!(result: "1 - 0",
                    ply_count_total: 7,
                    initial_position: "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
                    name: "Coup du berger")

p1 = Ply.create!(game: game2, ply_count: 1, parent: nil, move: "e4", status: "main")
p2 = Ply.create!(game: game2, ply_count: 2, parent: p1, move: "e5", status: "main")
p3 = Ply.create!(game: game2, ply_count: 3, parent: p2, move: "Fc4", status: "main")
p4 = Ply.create!(game: game2, ply_count: 4, parent: p3, move: "a6", status: "main")
p5 = Ply.create!(game: game2, ply_count: 5, parent: p4, move: "Dh5", status: "main")
p6 = Ply.create!(game: game2, ply_count: 6, parent: p5, move: "Cf6", status: "main")
p7 = Ply.create!(game: game2, ply_count: 7, parent: p6, move: "Dxf7", status: "main")

tag1 = Tag.create!(game: game1, collection: collection1)
tag2 = Tag.create!(game: game1, collection: collection2)
tag3 = Tag.create!(game: game1, collection: collection3)
tag4 = Tag.create!(game: game2, collection: collection7)


game2 = Game.create!(event: "World Chess Championship Match",
                    site: "London",
                    date: DateTime.new(2018,11,15,14),
                    round: 1,
                    result: "1/2 - 1/2",
                    ply_count_total: 50,
                    eco_code: "B33",
                    initial_position: "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
                    elo_white: 2832,
                    elo_black: 2835,
                    white_player: magnus,
                    black_player: fabiano)

game3 = Game.create!(event: "World Chess Championship Match",
                    site: "London",
                    date: DateTime.new(2018,11,15,14),
                    round: 2,
                    result: "1/2 - 1/2",
                    ply_count_total: 50,
                    eco_code: "B33",
                    initial_position: "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
                    elo_white: 2832,
                    elo_black: 2835,
                    white_player: fabiano,
                    black_player: magnus)














