class Api::V1::TicketmasterController < ApplicationController

    def search_by_artist

        events = "https://app.ticketmaster.com/discovery/v2/events?apikey=#{ENV["TICKETMASTER_API_KEY"]}&keyword=#{params[:artist_name]}&locale=*&size=50&classificationName=music"
        response = RestClient.get(events)
        json = JSON.parse(response.body)
        if json["_embedded"]
            render json: json["_embedded"]["events"], only: ["name", "url", "images"]
        else 
            render json: {message: "There are no events for #{params[:artist_name]}"}
        end
    end

    def search_by_city
        events = "https://app.ticketmaster.com/discovery/v2/events?apikey=#{ENV["TICKETMASTER_API_KEY"]}&locale=*&city=#{params[:city]}&size=50&classificationName=music"
        response = RestClient.get(events)
        json = JSON.parse(response.body)
        if json["_embedded"]
            render json: json["_embedded"]["events"], only: ["name", "url", "images"]
        else 
            render json: [{message: "There are no events in #{params[:city]}"}]
        end
    end

end


