require "test_helper"

class CommentTest < ActiveSupport::TestCase

  setup do
    @comment = comments(:one)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "content is necessary" do
    @comment.content = ""
    assert_not @comment.valid?
  end

  test "user must be logged in" do
    @comment.user_id = ""
    assert_not @comment.valid?
  end

  test "book id is necessary" do
    @comment.book_id = ""
    assert_not @comment.valid?
  end

end
