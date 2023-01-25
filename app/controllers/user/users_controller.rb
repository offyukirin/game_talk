class User::UsersController < ApplicationController
   before_action :set_user, only: [:favorites]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end
  
  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def edit
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
end
