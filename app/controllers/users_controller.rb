class UsersController < ApplicationController
  def create
    @user = User.find_by(user_params)
    if @user.save
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end
end