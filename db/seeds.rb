# db/seeds.rb

require 'faker'

100.times do
  time_value = format('%.2f', rand(0.0..10.0))
  rate_value = format('%.2f', rand(0.0..5.0))


  Track.create(
    title: Faker::Music::Phish.song,
    price: Faker::Commerce.price(range: 5.0..20.0),
    album_id: rand(1..45),
    time: time_value,
    rate: rate_value,
    download_times: rand(0..10000) 
  )
end

# 30.times do
#   Album.create(
#     title: Faker::Music::album,
#     price: Faker::Commerce.price(range: 10.0..30.0)
#   )
# end

