class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
  	@users = User.all
  end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.page(params[:page])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
			if @user.update(user_params)
			   flash[:success] = "User was successfully updated"
			   redirect_to admin_users_path
			else
				render "edit"
			end

	end

  def unsubscribe
    @user = User.find(params[:id])
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to admin_users_path
  end

private
  def user_params
    params.require(:user).permit(:name, :phone_number, :introduction, :is_deleted)
  end

end