class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user,   only: [:edit, :update]
  include SessionsHelper

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if current_user
      flash[:danger] = "Dude, wake up. You already have an account."
      redirect_to user_path(current_user)
    elsif @user.save
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

  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Your account has been terminated."
    redirect_to root_path
  end

  private

  	def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
