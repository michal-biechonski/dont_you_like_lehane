# USER ACTIONS NOT HANDLED BY DEVISE
class UsersController < ApplicationController
  expose :users, -> { User.all }
  expose :user

  before_action :require_logged_in, only: [:destroy]
  before_action :require_admin, only: [:destroy]

  def destroy
    user.destroy
    flash[:notice] = 'User was successfully deleted.'
    redirect_to users_path
  end

  private

  def require_logged_in
    return if signed_in?
    flash[:alert] = 'You must be logged in to do that.'
    redirect_to new_user_session_path
  end
end
