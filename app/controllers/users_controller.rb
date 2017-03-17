class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def edit
  end

  def update
    @user = User.update(user_params)
  end

  def destroy
  end
  
  def set_user
  end

  def user_params
  end


end
