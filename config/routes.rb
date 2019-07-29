Rails.application.routes.draw do

  resources :songs
  
  post "songs/upload", to: "songs#upload"

  resources :artists, only: [:show]

end
