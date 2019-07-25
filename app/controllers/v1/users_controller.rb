class V1::UsersController < ApplicationController

    def index
        users = User.all
        render json: users, only: :username
    end

    def create
        user = User.create(username: params[:username])
        render json: user
    end

end