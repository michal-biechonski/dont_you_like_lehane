class BookPolicy
  attr_reader :user, :book

  def initialize(user, book)
    raise Pundit::NotAuthorizedError, 'You must be logged in to do that.' unless user
    @user = user
    @book = book
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
