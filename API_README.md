The Final FM API

This API was created for a react project. It uses the Ticketmaster API to return event data and uses the Last FM API to seed our database with song and artist information.

Routes

  Our API has artists, songs, and event data. All of these endpoints can be reached through similar routes.
  
  * Artists
    - Example Route: https://final-fm-api.herokuapp.com/api/v1/artists
    - This example route would return all of the artist information and each artists song information
    
  * Songs
    - Example Route: https://final-fm-api.herokuapp.com/api/v1/songs
    - This example route would return all of the song information and each song would also return it's artist information
    
  * Events
    - Example Route: https://final-fm-api.herokuapp.com/events-by-artist?artist_name=billie
    - This example route would return all tickemaster music events with the keyword billie

Using the API

This API uses the postgresql gem for database creation so you will need to have the postgres app downloaded to setup your own database.

To get started you can clone this repository down, run bundle install, rails db:create, and then rails db:seed to setup your database. Before seeding, you will need to get an api key from Last FM. You can request one from their API home page here https://secure.last.fm/login?next=/api/account/create.
  
Once you have a Last FM API key you will be able to seed your database with song and artist information but you will not be able to query the event routes as they require a Ticketmaster API key. The Ticketmaster API home page also has a link where you can request an API key.
 
After getting both your Last FM and Ticketmaster API keys, you will need to update the .env.sample file to include your api keys in the respective locations. Then you can simply remove the .sample from the end of the .env.sample file and you will be able to seed your database and query the event related routes.

Contributors

* Both the front and backends of this project were built by Austin Harlow and DaNeil Coulthard.

* Github Links
    - https://github.com/AustinBH
    - https://github.com/caffiendkitten

* The data that we used for this project is from the Ticketmaster API and Last FM API.