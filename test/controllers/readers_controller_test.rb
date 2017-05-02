require "test_helper"

class ReadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:three)
    @book = books(:three)
  end

  test "should create reader" do
    sign_in @user
    assert_difference("Reader.count", 1) do
      assert_difference("FutureReader.count", -1) do
        post book_readers_url(@book)
      end
    end
  end

  test "should create reader using ajax" do
    sign_in @user
    assert_difference("Reader.count", 1) do
      assert_difference("FutureReader.count", -1) do
        post book_readers_url(@book), xhr: true
      end
    end
    assert_match "Didn&#39;t read it", @response.body
    # assert_match "Didn"t read it", @response.body.
    # TODO change to didn"t read it, escape, parse...
    assert_match "Add to wishlist", @response.body
    assert_equal "text/javascript", @response.content_type
  end

  test "should not create reader if not logged in" do
    assert_no_difference("Reader.count") do
      post book_readers_url(@book)
    end
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_select "div#flash_alert", "You must be logged in to do that."
  end

  test "should not create reader if it already exists" do
    sign_in users(:one)
    assert_no_difference("Reader.count") do
      post book_readers_url(books(:one))
    end
    assert_redirected_to books(:one)
    follow_redirect!
    assert_select "div#flash_alert", "You've already selected that book"
  end

  test "should delete reader" do
    sign_in users(:one)
    assert_difference("Reader.count", -1) do
      delete book_reader_url(books(:one), users(:one))
    end
  end

  test "should delete reader using ajax" do
    sign_in users(:one)
    assert_difference("Reader.count", -1) do
      delete book_reader_url(books(:one), users(:one)), xhr: true
    end
    assert_match "Already read it", @response.body
    assert_equal "text/javascript", @response.content_type
  end

  test "should not delete reader if it doesn't exist" do
    sign_in users(:admin)
    assert_no_difference("Reader.count") do
      delete book_reader_url(books(:two), users(:admin))
    end
    assert_redirected_to books(:two)
    follow_redirect!
    assert_select "div#flash_alert", "You haven't read that book!"
  end

  test "should not delete reader if not logged in" do
    assert_no_difference("Reader.count") do
      delete book_reader_url(books(:one), users(:one))
    end
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_select "div#flash_alert", "You must be logged in to do that."
  end
end
