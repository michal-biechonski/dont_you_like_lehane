class UsersController < ApplicationController

  before_action :set_user, only: [:show, :destroy]
  before_action :require_logged_in, only: [:destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    flash[:notice] = "User was successfully deleted."
    redirect_to users_path
  end


    private

    def set_user
      @user = User.find(params[:id])
    end

    def require_logged_in
      unless signed_in?
        flash[:alert] = "You have to be logged in to do that."
        redirect_to new_user_session_path        
      end
    end

    def require_admin
      unless signed_in? && current_user.admin?
        flash[:alert] = "Only administrator have access to do this task."
        redirect_to users_path
      end
    end

end
