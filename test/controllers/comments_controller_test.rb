require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @third_users_comment = comments(:one)
    sign_in users(:one)
  end

  test "should get new" do
    get new_book_comment_url(@book)
    assert_response :success
  end

  test "should not get comment if not logged in" do
    sign_out users(:one)
    get new_book_comment_url(@book)
    assert_redirected_to new_user_session_url
  end

  test "should get create" do
    assert_difference("Comment.count", 1) do
      post book_comments_url(
        @book, params: { comment: { content: "some random text" } }
      )
    end
    assert_redirected_to @book
  end

  test "should not create if not logged in" do
    sign_out users(:one)
    assert_no_difference("Comment.count") do
      post book_comments_url(
        @book, params: { comment: { content: "some random text" } }
      )
    end
    assert_redirected_to new_user_session_url
  end

  test "should get destroy" do
    assert_difference("Comment.count", 1) do
      post book_comments_url(
        @book, params: { comment: { content: "some random text" } }
      )
    end
    @comment = assigns(:comment)
    assert_redirected_to @book
    assert_difference("Comment.count", -1) do
      delete book_comment_url(@book, @comment)
    end
    assert_redirected_to @book
  end

  test "shouldn't destroy if not logged in or if created by different user" do
    assert_no_difference("Comment.count") do
      delete book_comment_url(@book, @third_users_comment)
    end
    assert_redirected_to users_url
    sign_out users(:one)
    assert_no_difference("Comment.count") do
      delete book_comment_url(@book, @third_users_comment)
    end
    assert_redirected_to new_user_session_url
  end

  test "should destroy any comments if admin" do
    sign_out users(:one)
    sign_in users(:admin)
    assert_difference("Comment.count", -1) do
      delete book_comment_url(@book, @third_users_comment)
    end
    assert_redirected_to @book
  end
end
