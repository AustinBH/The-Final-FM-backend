class Api::V1::TicketmasterController < ApplicationController

    def search_by_artist

        events = "https://app.ticketmaster.com/discovery/v2/events?apikey=#{ENV["TICKETMASTER_API_KEY"]}&keyword=#{params[:artist_name]}&locale=*&size=50&classificationName=music"
        response = RestClient.get(events)
        json = JSON.parse(response.body)
        if json["_embedded"]
            render json: json["_embedded"]["events"], only: ["name", "url", "images"]
        else 
            render json: {message: "there are no events for #{params[:artist_name]}"}
        end
    end

    # def search_by_city
    #     eventCity = ""
    #     response = RestClient.get(eventCity)
    #     json = JSON.parse(response.body)
    # end

end


