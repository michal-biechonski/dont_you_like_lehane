# APPLICATION CONTROLER
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_reader
    return unless user_signed_in?
    set_book
    @exist_reader = Reader.where("user_id = ? AND book_id = ?",
                                 current_user.id, @book.id).take
  end

  def set_future_reader
    return unless user_signed_in?
    set_book
    @fut_reader = FutureReader.where("user_id = ? AND book_id = ?",
                                     current_user.id, @book.id).take
  end

  def set_user
    if user_signed_in?
      @user = current_user
    else
      flash[:alert] = "You must be logged in to do that."
      redirect_to new_user_session_path
    end
  end

  def require_admin
    return if current_user.admin?
    flash[:alert] = "Only administrators have access to do this task."
    redirect_to users_path
  end

  def same_user(resource)
    return if current_user.admin? || (current_user.id == resource.user_id)
    type = if resource == @comment
             "comments"
           else
             "posts"
           end
    flash[:alert] = "You can only do this to your own #{type}!"
    redirect_to users_path
  end
end
