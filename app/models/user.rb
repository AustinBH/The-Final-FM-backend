class User < ApplicationRecord
    has_many :liked_songs
    has_many :songs, through: :liked_songs
    has_many :artists, through: :songs

    validates :username, uniqueness: true

    # has_secure_password
end
