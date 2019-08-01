class Song < ApplicationRecord
    belongs_to :artist
    has_many :liked_songs
    has_many :users, through: :liked_songs
end
