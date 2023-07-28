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
end
