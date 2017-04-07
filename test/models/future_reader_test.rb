require 'test_helper'

class FutureReaderTest < ActiveSupport::TestCase

  setup do
    @fut_read = future_readers(:one)
  end

  test "should be valid" do
    assert @fut_read.valid?
  end

  test "user_id is necessary" do
    @fut_read.user_id = ""
    assert_not @fut_read.valid?
  end

  test "book_id is necessary" do
    @fut_read.book_id = ""
    assert_not @fut_read.valid?
  end

  test "should be unique" do
    sign_in users(:three)
    @fut_read2 = User.find(users(:three).id).future_readers.build()
    @fut_read2.book_id = @fut_read.book_id
    assert_not @fut_read2.valid?
  end

end
