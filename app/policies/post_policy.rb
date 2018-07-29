class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user
    @user = user
    @post = post
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    user.admin? || user.id == post.user_id
  end

  def update?
    user.admin? || user.id == post.user_id
  end

  def destroy?
    user.admin? || user.id == post.user_id
  end
end
