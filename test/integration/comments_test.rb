require "test_helper"

class CommentsTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    @admin = users(:admin)
    @book = books(:one)
    @comment2 = comments(:two)
  end

  test "add and delete comments" do
    get book_url(@book)
    assert_template "books/show"
    assert_not logged_in?
    assert_select "a[href=?]", new_book_comment_path(@book), count: 0
    get new_book_comment_path(@book)
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_select "div#flash_alert", "You must be logged in to do that."

    assert_no_difference("Comment.count") do
      post book_comments_url(@book), params: { comment: { content: "some random content" } }
    end
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_select "div#flash_alert", "You must be logged in to do that."

    get new_user_session_url
    post user_session_url, params: { user: { email: @user.email, password: "password" } }
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice", "Signed in successfully."
    assert logged_in?
    get book_url(@book)
    assert_template "books/show"
    assert_select "a[href=?]", new_book_comment_path(@book)

    get new_book_comment_path(@book)
    assert_template "comments/new"
    assert_difference("Comment.count", 1) do
      post book_comments_url(@book), params: { comment: { content: "some random content" } }
    end
    @comment = assigns(:comment)
    assert_redirected_to @book
    follow_redirect!
    assert_select "div#flash_notice", "Comment was successfully added."
    assert_equal @comment.content, "some random content"
    assert_equal @comment.user_id, @user.id
    assert_equal @comment.book_id, @book.id

    delete destroy_user_session_url
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice", "Signed out successfully."
    assert_not logged_in?
    get book_url(@book)
    assert_template "books/show"
    assert_select "a[href=?]", book_comment_path(@book, @comment), count: 0
    assert_no_difference("Comment.count") do
      delete book_comment_url(@book, @comment)
    end
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_select "div#flash_alert", "You must be logged in to do that."

    post user_session_url, params: { user: { email: @user.email, password: "password" } }
    assert logged_in?
    get book_url(@book)
    assert_template "books/show"
    assert_select "a[href=?]", book_comment_path(@book, @comment)
    assert_difference("Comment.count", -1) do
      delete book_comment_url(@book, @comment)
    end
    assert_redirected_to @book
    follow_redirect!
    assert_select "div#flash_notice", "Comment was successfully deleted."

    get book_url(books(:two))
    assert_template "books/show"
    assert_select "a[href=?]", book_comment_path(books(:two), @comment2), count: 0
    assert_no_difference("Comment.count") do
      delete book_comment_url(books(:two), @comment2)
    end
    assert_redirected_to users_url
    follow_redirect!
    assert_select "div#flash_alert", "You can only do this to your own comments!"

    delete destroy_user_session_url
    assert_not logged_in?
    post user_session_url, params: { user: { email: @admin.email, password: "password" } }
    assert logged_in?
    get book_url(books(:two))
    assert_template "books/show"
    assert_select "a[href=?]", book_comment_path(books(:two), @comment2)
    assert_difference("Comment.count", -1) do
      delete book_comment_url(books(:two), @comment2)
    end
    assert_redirected_to books(:two)
    follow_redirect!
    assert_select "div#flash_notice", "Comment was successfully deleted."
  end

end
