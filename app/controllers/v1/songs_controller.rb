class V1::SongsController < ApplicationController

    def index
        songs = Song.all
        render json: songs, :include => {:artist => {:except => [:created_at, :updated_at]}}, except: [:created_at, :updated_at]
    end

    def show
        song = Song.find(params[:id])
        render json: song, :include => {:artist => {:except => [:created_at, :updated_at]}}, except: [:created_at, :updated_at]
    end

end