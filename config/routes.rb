Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :artists, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  post 'songs/upload', to: 'songs#upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
