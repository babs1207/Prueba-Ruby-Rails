Rails.application.routes.draw do
  get 'todos', to:'todos#index'
  get 'todos/new', as: 'new_todo'
  resources :todos, only: [:create]  
  get 'todos/:id', to: 'todos#show', as:'todo'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'todos#index'
end
