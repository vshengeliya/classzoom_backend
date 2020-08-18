Rails.application.routes.draw do
  # root 'static_pages#home'
  resources :classrooms, only: [:index, :show]

  get '/meetings' => 'zoom_meetings#index', as: 'meetings'
  get '/meetings/:id' => 'zoom_meetings#show', as: 'meeting'
  post '/meetings' => 'zoom_meetings#create'
  delete '/meetings/:id' => 'zoom_meetings#destroy'

  resources :students, only: [:index, :show]
  resources :teachers, only: [:index, :show]
end
