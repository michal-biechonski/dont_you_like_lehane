class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_reader
    set_book
    @exist_reader = Reader.where("user_id = ? AND book_id = ?", current_user.id, @book.id).take
  end

  def set_future_reader
    set_book
    @fut_reader = FutureReader.where("user_id = ? AND book_id = ?", current_user.id, @book.id).take
  end


end
