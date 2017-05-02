require "test_helper"

class BookTest < ActiveSupport::TestCase
  setup do
    @book = books(:one)
    @book2 = books(:two)
  end

  test "should be valid" do
    assert @book.valid?
  end

  test "title is required" do
    @book.title = ""
    assert_not @book.valid?
  end

  test "title must be unique" do
    @book.title = "random"
    @book.save
    @book2.title = "random"
    assert_not @book2.valid?
  end

  test "description is required" do
    @book.description = ""
    assert_not @book.valid?
  end

  test "published date is required" do
    @book.published_at = ""
    assert_not @book.valid?
  end
end
