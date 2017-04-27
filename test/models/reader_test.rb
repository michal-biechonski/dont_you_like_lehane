require "test_helper"

class ReaderTest < ActiveSupport::TestCase
  setup do
    @reader = readers(:one)
  end

  test "should be valid" do
    assert @reader.valid?
  end

  test "user_id is necessary" do
    @reader.user_id = ""
    assert_not @reader.valid?
  end

  test "book_id is necessary" do
    @reader.book_id = ""
    assert_not @reader.valid?
  end

  test "should be unique" do
    sign_in users(:one)
    @reader2 = User.find(users(:one).id).readers.build
    @reader2.book_id = @reader.book_id
    assert_not @reader2.valid?
  end
end
