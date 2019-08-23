class SongsController < ApplicationController
  require 'csv'

  def upload
    CSV.foreach(params[:songs].path, headers: true) do |song|
      new_song = Song.create(title: song["Song Clean"])
      new_song.build_artist(name: song["ARTIST CLEAN"])
      new_song.save
    end
    redirect_to(songs_path)
  end

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

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
