class V1::LikedSongsController < ApplicationController

    def create
        liked_song = LikedSong.create(artist_id: params[:artist_id], user_id: params[:user_id])
        render json: liked_song
    end

end