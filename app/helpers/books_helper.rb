# HELPERS FOR BOOKS CONTROLLER
module BooksHelper
  def already_read_this?
    @read = Reader.where('user_id = ? AND book_id = ?',
                         current_user.id, @book.id)
    return true unless @read.empty?
  end

  def wants_to_read_this?
    @future_read = FutureReader.where('user_id = ? AND book_id = ?',
                                      current_user.id, @book.id)
    return true unless @future_read.empty?
  end
end
