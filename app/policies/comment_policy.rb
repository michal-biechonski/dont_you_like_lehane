class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user
    @user = user
    @comment = comment
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    user.admin? or user.id == comment.user_id
  end
end
