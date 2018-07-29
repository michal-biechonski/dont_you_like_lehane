class ReadablePolicy
  attr_reader :user, :readable

  def initialize(user, readable)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user
    @user = user
    @readable = readable
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
