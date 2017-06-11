class UsersController < ApplicationController
	
	def new
		puts params
		@user = User.new
  end

  def create
    @user = User.new(user_params)
 
	  @user.save
	  redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password)
	end
end
