Rails.application.routes.draw do
  resources :songs, :artists 
  post 'songs/upload', to: 'songs#upload'
end
