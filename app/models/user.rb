class User < ApplicationRecord
    has_many :liked_songs
    has_many :songs, through: :liked_songs
    has_many :artists, through: :songs
end
