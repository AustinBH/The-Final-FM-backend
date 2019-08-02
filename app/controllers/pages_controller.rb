class PagesController < ApplicationController

    def home
        readme = File.read("#{Rails.root}/API_README.md")
        render json: readme
    end
end