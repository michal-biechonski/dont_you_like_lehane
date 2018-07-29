# APPLICATION CONTROLLER
class ApplicationController < ActionController::Base
  include Pundit
  include BooksHelper
  include DeviseHelper
  protect_from_forgery with: :exception
  # rescue_from Pundit::NotAuthorizedError do |custom_msg|
  #   user_not_authorized(custom_msg)
  # end
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  # FIXME: refactor and/or move it

  def login_page
    new_user_session_url unless current_user
  end

  def users_page
    users_url unless current_user&.admin?
  end

  # def user_not_authorized(custom_msg = nil)
  def user_not_authorized
    # display_flash_error(custom_msg)
    display_flash_error
    redirect_to(login_page || users_page || request.referrer || root_url)
  end

  def not_admin_message
    'Only administrators have access to do this task.'
  end

  def not_logged_in_message
    'You must be logged in to do that.'  
  end

  def display_flash_error(custom_msg = nil)
    flash[:alert] = if !custom_msg.nil?
                      custom_msg
                    elsif current_user
                      not_admin_message
                    else
                      not_logged_in_message
                    end
  end
end
