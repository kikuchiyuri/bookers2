Rails.application.routes.draw do
  root to: "homes#top"
  get 'about' => 'homes#about'
  devise_for :users
  resources :books
  resources :users, only: [:index, :show, :edit, :update]

  #get '*path', controller: 'application', action: 'render_404'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
