Rails.application.routes.draw do

root to: "homes#top"
get "/homes/about" => "homes#about", as: "about"

namespace :user do
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit]
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
