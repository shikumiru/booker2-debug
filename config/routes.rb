Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get "search" => "users#search"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :chats, only: [:show, :create]

  # User/Book 検索用
  get "search" => 'searches#search'

  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
    resource :group_users, ionly: [:create, :destroy]
  end
end