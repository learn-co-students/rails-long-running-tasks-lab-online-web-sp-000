Rails.application.routes.draw do
  resources :songs
  resources :artists, only: [:new, :edit, :show]

   post 'songs/upload', to: 'songs#upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
