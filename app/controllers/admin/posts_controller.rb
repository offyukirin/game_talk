class Admin::PostsController < ApplicationController

  def index
    @post = Post.page(params[:page])
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end


    # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :content, tag_ids: [])
  end

end
