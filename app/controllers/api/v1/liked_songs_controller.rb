class Api::V1::LikedSongsController < ApplicationController

    def create
        liked_song = LikedSong.create(song_id: params[:song_id], user_id: params[:user_id])
        render json: liked_song
    end

    def destroy
        liked_song = LikedSong.find_by(song_id: params[:song_id], user_id: params[:user_id])
        liked_song.delete
        render json: {Message: "Success"}
    end

end