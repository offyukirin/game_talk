class User::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  # 投稿データの保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    redirect_to user_posts_path
    else
      render :new
    end
  end

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to user_posts_path
  end


  # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end


end
