class ShowTracks
  def self.show_all_tracks(limit_param, params)
    limit_param = limit_param ? limit_param : 3
    if params[:popular].present?
      @tracks = Track.most_popular(limit_param)
    elsif params[:unpopular].present? 
      @tracks = Track.most_unpopular(limit_param)
    else
      @tracks = Track.all
    end
    @tracks
  end

  def self.track_titles_with_quantities
    track_titles_with_quantities = []

    Track.includes(:track_quantity, :album).each do |track|
      quantity = track.track_quantity&.quantity || 0
      album_title = track.album&.title || 'Unknown Album'
      track_titles_with_quantities << { title: track.title, quantity: quantity, album_title: album_title }
    end
    
    track_titles_with_quantities
  end
end
