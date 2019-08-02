# The Final FM API

![](https://media.giphy.com/media/RnX4q6yYDoYCI/giphy.gif)

This API was created for a react project. It uses the [Ticketmaster API](https://developer.ticketmaster.com/) to return event data and uses the [Last FM API](https://www.last.fm/api) to seed our database with song and artist information.

Our API is currently hosted at https://final-fm-api.herokuapp.com/. While we do not have a landing page at this time all of the below routes do return data. However, as it is hosted on heroku it can take a short while for the data to be returned if the server isn't already running.

## Routes

![](https://media.giphy.com/media/3ohs7Td2HosDPOLBGU/giphy.gif)

  Our API has artists, songs, and event data. All of these endpoints can be reached through similar routes.
  
  * Artists
    - Example Route: `https://final-fm-api.herokuapp.com/api/v1/artists`
    - This example route would return all of the artist information and each artists song information
    
  * Songs
    - Example Route: `https://final-fm-api.herokuapp.com/api/v1/songs`
    - This example route would return all of the song information and each song would also return it's artist information
    
   * Events
    - Example Route: `https://final-fm-api.herokuapp.com/events-by-artist?artist_name=billie`
    - This example route would return all tickemaster music events with the keyword billie

## Using the API

![](https://media.giphy.com/media/ue5ZwFCaxy64M/giphy.gif)

This API uses the postgresql gem for database creation so you will need to have the postgres app downloaded to setup your own database.

To get started you can clone this repository down, run bundle install, rails db:create, and then rails db:seed to setup your database. Before seeding, you will need to get an api key from Last FM. You can request one from their API home page or using this [direct link](https://secure.last.fm/login?next=/api/account/create).
  
Once you have a Last FM API key you will be able to seed your database with song and artist information but you will not be able to query the event routes as they require a Ticketmaster API key. The Ticketmaster API home page also has a link where you can request an API key but I have also included a [direct link](https://developer-acct.ticketmaster.com/user/login).
 
After getting both your Last FM and Ticketmaster API keys, you will need to update the .env.sample file to include your api keys in the respective locations. Then you can simply remove the .sample from the end of the .env.sample file and you will be able to seed your database and query the event related routes.

## Contributors

![](https://media.giphy.com/media/3oEjHWXddcCOGZNmFO/giphy.gif)

* Both the front and backends of this project were built by [Austin Harlow](https://github.com/AustinBH) and [DaNeil Coulthard](https://github.com/caffiendkitten).
* The data that we used for this project is from the [Ticketmaster API](https://developer.ticketmaster.com/) and [Last FM API](https://www.last.fm/api).
