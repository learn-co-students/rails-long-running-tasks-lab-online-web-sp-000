class SongsController < ApplicationController
  require 'csv'

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  def upload
  
    CSV.foreach(params[:file].path, headers: true) do |song|
      newSong = Song.new(title: song[0])
      newSong.artist = Artist.find_or_create_by(name: song[1])
      newSong.save
    end
    redirect_to songs_path
  end
  # Back In Black,AC/DC,1980,Back In Black by AC/DC,1,1,97,97
  # create_table "songs", force: :cascade do |t|
  #   t.string   "title"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.integer  "artist_id"

  # create_table "artists", force: :cascade do |t|
  #   t.string   "name"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
