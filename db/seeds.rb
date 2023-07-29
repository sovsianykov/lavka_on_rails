# db/seeds.rb
require 'faker'

# Create Music Style Categories
# music_styles = ['Rock', 'Pop', 'Jazz', 'Hip-Hop', 'Classical', 'Electronic', 'Country', 'R&B', 'Reggae', 'Blues']

# music_styles.each do |style|
#   Category.create(name: style)
# end

# Seed Tracks and Albums with Categories
100.times do
  time_value = format('%.2f', rand(0.0..10.0))
  rate_value = format('%.2f', rand(0.0..5.0))

  Track.create(
    title: Faker::Music::Phish.song,
    price: Faker::Commerce.price(range: 5.0..20.0),
    album_id: rand(108..160),
    time: time_value,
    rate: rate_value,
    download_times: rand(0..10000),
  )
end

# 30.times do
#   # Select a random category for the album
#   category = Category.all.sample

#   Album.create(
#     title: Faker::Music.album,
#     price: Faker::Commerce.price(range: 10.0..30.0),
#     category: category   # Associate album with a category
#   )
# end
