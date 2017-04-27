require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @post = posts(:first_user_post)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title is necessary" do
    @post.title = ""
    assert_not @post.valid?
  end

  test "content is necessary" do
    @post.content = ""
    assert_not @post.valid?
  end

  test "user must be logged in" do
    @post.user_id = ""
    assert_not @post.valid?
  end
end
