class Song < ApplicationRecord
  belongs_to :artist
  require 'csv'

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
    self.save
  end

  def self.upload(file)
    CSV.foreach(file.path, headers: true) do |row|
      row_hash = row.to_hash
      song_hash = {"title": row_hash["Song Clean"]}
      new_song = Song.new song_hash
      new_song.artist_name = row_hash["ARTIST CLEAN"]
      new_song.save!
    end
  end
end
