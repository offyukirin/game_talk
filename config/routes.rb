Rails.application.routes.draw do

root to: "homes#top"
get "/homes/about" => "homes#about", as: "about"

get "search" => "searches#search"


namespace :user do

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resources :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get :favorites
    end

  end

end

namespace :admin do

  resources :users, only: [:index, :show, :edit, :destroy] do
    member do
        get "unsubscribe"
        patch "withdraw"
        post "withdraw"
      end
  end
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
  resources :favorites, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]

  end
end

 # ユーザー用
# URL /user/sign_in ...
devise_for :user,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}


 # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
