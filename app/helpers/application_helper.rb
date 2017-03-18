module ApplicationHelper

  def show_avatar(user, height = 100)
    gravatar(user, height)
  end

  def gravatar(user, size)
    id = Digest::MD5::hexdigest(user.email.downcase)
    path = "https://secure.gravatar.com/avatar/#{id}?s=#{size}&d=mm"
    image_tag(path, alt: user.name)
  end

end
