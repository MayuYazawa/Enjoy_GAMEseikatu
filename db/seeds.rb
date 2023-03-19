# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admins = [
  {email: 'enjoy_game_seikatu@game', password: 'enjoygame'},
]

admins.each do |admin|
  admin_data = Admin.find_by(email: admin[:email])
  if admin_data.nil?
    Admin.create(email: admin[:email], password: admin[:password])
  end
end

# Admin.create!(
#   email: 'enjoy_game_seikatu@game',
#   password: 'enjoygame'
# )

device_genre_names = [
'Nintendo Switch',
'Wii U',
'Wii',
'ニンテンドー3DS',
'ニンテンドーDS',
'PS5',
'PS4',
'PS3',
'PS2',
'PS Vita',
'PSP',
'Xbox Series X',
'Xbox One',
'Xbox 360'
]

device_genre_names.each do |name|
  DeviceGenre.find_or_create_by(
    device_genre_name: name
  )
end

game_genre_names = [
'RPG',
'シミュレーション',
'格闘・アクション',
'アドベンチャー',
'シューティング',
'スポーツ・レース',
'テーブル・パズル',
'教育・学習',
'その他',
]

game_genre_names.each do |name|
  GameGenre.find_or_create_by(
    game_genre_name: name
  )
end