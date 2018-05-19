module ReadersUsers
  def book_read_by(book, user)
    where("user_id = ? AND book_id = ?", user.id, book.id)[0]
  end
end