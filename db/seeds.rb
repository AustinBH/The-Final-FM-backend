require './config/api_keys.rb'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artists_page_1 = "https://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=#{LAST_FM_API_KEY}&page=1&format=json"
    response_1 = RestClient.get(artists_page_1)
    json_1 = JSON.parse(response_1.body)

artists_page_2 = "https://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=#{LAST_FM_API_KEY}&page=4&format=json"
    response_2 = RestClient.get(artists_page_2)
    json_2 = JSON.parse(response_2.body)

counter_1 = 0
counter_2 = 0
    
while counter_1 < 50 do
    name = json_1["artists"]["artist"][counter_1]["name"]

    songs_page = "https://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=#{name.gsub(/ /, "+").gsub(/é/, 'e')}&api_key=#{LAST_FM_API_KEY}&format=json"
    response_3 = RestClient.get(songs_page)
    json_3 = JSON.parse(response_3.body)

    title = json_3["toptracks"]["track"][0]["name"]

    artist = Artist.create(name: name)
    song = Song.create(title: title, artist: artist)

    song_info = "https://ws.audioscrobbler.com/2.0/?method=track.getinfo&artist=#{name.gsub(/ /, "+").gsub(/é/, 'e')}&api_key=#{LAST_FM_API_KEY}&track=#{song.title.gsub(/ /, "+").gsub(/ï/, "i")}&format=json"
    response_4 = RestClient.get(song_info)
    json_4 = JSON.parse(response_4.body)

    if json_4["track"]["album"] 
        album_name = json_4["track"]["album"]["title"]
        album_img_url = json_4["track"]["album"]["image"][2]["#text"]
    else
        album_name = 'unspecified'
        album_img_url = 'unspecified'
    end

    song.update(album_name: album_name, album_img_url: album_img_url)

    counter_1 += 1
end

while counter_2 < 50 do
    name = json_2["artists"]["artist"][counter_2]["name"]

    songs_page = "https://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=#{name.gsub(/ /, "+").gsub(/ë/, 'e')}&api_key=#{LAST_FM_API_KEY}&format=json"
    response_3 = RestClient.get(songs_page)
    json_3 = JSON.parse(response_3.body)

    title = json_3["toptracks"]["track"][0]["name"]

    artist = Artist.create(name: name)
    song = Song.create(title: title, artist: artist)

    song_info = "https://ws.audioscrobbler.com/2.0/?method=track.getinfo&artist=#{name.gsub(/ /, "+").gsub(/ë/, 'e')}&api_key=#{LAST_FM_API_KEY}&track=#{song.title.gsub(/ /, "+").gsub(/ï/, "i")}&format=json"
    response_4 = RestClient.get(song_info)
    json_4 = JSON.parse(response_4.body)

    if json_4["track"]["album"] 
        album_name = json_4["track"]["album"]["title"]
        album_img_url = json_4["track"]["album"]["image"][2]["#text"]
    else
        album_name = 'unspecified'
        album_img_url = 'unspecified'
    end

    song.update(album_name: album_name, album_img_url: album_img_url)

    counter_2 += 1
end


