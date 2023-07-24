# db/seeds.rb

require 'faker'

100.times do
  Track.create(
    title: Faker::Music::Phish.song,
    price: Faker::Commerce.price(range: 5.0..20.0),
    album_id: rand(1..2)
  )
end

10.times do
  Album.create(
    title: Faker::Music::album,
    price: Faker::Commerce.price(range: 10.0..30.0)
  )
end

