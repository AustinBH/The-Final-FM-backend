class Api::V1::TicketmasterController < ApplicationController

    def search_by_artist

        events = "https://app.ticketmaster.com/discovery/v2/events?apikey=#{ENV["TICKETMASTER_API_KEY"]}&keyword=#{params[:artist_name]}&locale=*&size=50&classificationName=music"
        response = RestClient.get(events)
        json = JSON.parse(response.body)
        render json: json["_embedded"]["events"], only: ["name", "url", "images"]
        # render json: json["_embedded"]["events"], only: ["name", :url, :images[0], :dates]
    end

    # def search_by_city
    #     eventCity = ""
    #     response = RestClient.get(eventCity)
    #     json = JSON.parse(response.body)
    # end

end


