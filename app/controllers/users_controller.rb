class UsersController < ApplicationController
  include SessionsHelper
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
    	flash[:success] = "Guess what, booklover? You have an account! A bonafide account!"
      redirect_to @user
    else
      render 'new'
    end 
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "There you go! Your info has been updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  	def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end