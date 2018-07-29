class UserPolicy
  attr_reader :user

  def initialize(user, _)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user
    @user = user
  end

  def destroy?
    user.admin?
  end
end
