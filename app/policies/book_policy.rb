class BookPolicy
  attr_reader :user, :book

  def initialize(user, book)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user
    @user = user
    @book = book
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end
end
