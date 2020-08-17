Rails.application.routes.draw do
  resources :classrooms, only: [:index, :show]
  resources :students, only: [:index, :show]
  resources :teachers, only: [:index, :show]
end
