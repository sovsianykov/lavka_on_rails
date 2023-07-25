class Track < ApplicationRecord
  belongs_to :album
  
  def self.average_price
    format('%.2f',average(:price))
  end

  def self.most_popular(limit_param)
    order(download_times: :desc).limit(limit_param)
  end

  def self.most_unpopular(limit_param)
    order(download_times: :asc).limit(limit_param)
  end
end
