Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :songs, only: [:index, :new, :edit, :show]
  resources :artists, only: [:edit, :new, :show]
  post 'songs/upload', to: 'songs#upload'
end
