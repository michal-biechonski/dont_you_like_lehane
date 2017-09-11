# HELPERS FOR BOOKS CONTROLLER
module BooksHelper
  def already_read_this?
    read = Reader.where("user_id = ? AND book_id = ?",
                         current_user.id, @book.id)
    return true unless read.empty?
  end

  def wants_to_read_this?
    future_read = FutureReader.where("user_id = ? AND book_id = ?",
                                      current_user.id, @book.id)
    return true unless future_read.empty?
  end

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

  def reader(type)
    # TODO: instead of 2 set readers methods create 1
    return unless user_signed_in?
    set_book
    # class_name = 
    instant_variable_set(:"@#{type}", )
  end
end
