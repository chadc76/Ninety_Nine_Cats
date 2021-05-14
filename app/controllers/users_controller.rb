class UsersController < ApplicationController
  before_action :current_user?, except: [:show]
  before_action :require_current_user!, only: [:show]
  before_action :is_current_user?, only: [:show]

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

  def show
    # fail
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end