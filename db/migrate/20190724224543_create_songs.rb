class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :artist_id
      t.string :title
      t.string :album_name
      t.string :album_img_url

      t.timestamps
    end
  end
end
