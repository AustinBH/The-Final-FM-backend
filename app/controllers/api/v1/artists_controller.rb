class Api::V1::ArtistsController < ApplicationController

    def index
        artists = Artist.all
        render json: artists, :include => {:songs => {:except => [:created_at, :updated_at]}}, only: :name
    end

    def show
        artist = Artist.find(params[:id])
        render json: artist, :include => {:songs => {:except => [:created_at, :updated_at]}}, only: :name
    end

end