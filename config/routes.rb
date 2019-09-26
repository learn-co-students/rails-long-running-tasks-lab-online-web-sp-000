Rails.application.routes.draw do
  resources :songs, only: [:index]
  post 'songs/upload', to: 'songs#upload'
end
