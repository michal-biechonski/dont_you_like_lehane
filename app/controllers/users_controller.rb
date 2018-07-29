# USER ACTIONS NOT HANDLED BY DEVISE
class UsersController < ApplicationController
  expose :users, -> { User.all }
  expose :user

  # before_action :require_logged_in, only: [:destroy]
  # before_action :require_admin, only: [:destroy]

  def destroy
    authorize user
    user.destroy
    flash[:notice] = 'User was successfully deleted.'
    redirect_to users_path
  end
end
