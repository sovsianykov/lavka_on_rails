class Category < ApplicationRecord
  has_many :albums, foreign_key: "id"
end
