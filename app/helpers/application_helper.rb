module ApplicationHelper

  def show_avatar(user, height = 100)
    gravatar(user, height)
  end

  def gravatar(user, size)
    id = Digest::MD5::hexdigest(user.email.downcase)
    path = "https://secure.gravatar.com/avatar/#{id}?s=#{size}&d=mm"
    image_tag(path, alt: user.name)
  end

  def already_read_this?
    @read = Reader.where("user_id = ? AND book_id = ?", current_user.id, @book.id)
    unless @read.empty?
      return true
    end
  end

  def wants_to_read_this?
    @future_read = FutureReader.where("user_id = ? AND book_id = ?", current_user.id, @book.id)
    unless @future_read.empty?
      return true
    end
  end

end
