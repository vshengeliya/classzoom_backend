Rails.application.routes.draw do
  # root 'static_pages#home'
  resources :classrooms, only: [:index, :show]

  post '/meetings' => 'zoom_meetings#create', as: 'meetings'
  delete '/meetings/:id' => 'zoom_meetings#destroy', as: 'meeting'

  resources :students
  resources :teachers
end
