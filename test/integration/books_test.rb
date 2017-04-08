require 'test_helper'

class BooksTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    @admin = users(:admin)
  end

  test "add, edit, delete books" do
    get new_book_url
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_not_empty "flash#alert"
    assert_not logged_in?
    
    post user_session_url, params: { user: { email: @user.email, password: "password" } }
    assert_redirected_to root_url
    follow_redirect!
    assert_not_empty "flash#notice"
    assert logged_in?
    get new_book_url
    assert_redirected_to users_url
    follow_redirect!
    assert_not_empty "flash#alert"
    delete destroy_user_session_url
    assert_redirected_to root_url
    follow_redirect!
    assert_not_empty "flash#notice"
    assert_not logged_in?
    
    get new_user_session_url
    post user_session_url, params: { user: { email: @admin.email, password: "password" } }
    assert_redirected_to root_url
    follow_redirect!
    assert_not_empty "flash#notice"
    assert logged_in?
    get new_book_url
    assert_template "books/new"
    assert_difference("Book.count", 1) do
      post books_url, params: { book: { title: "some random book title", description: "some random book description", published_at: "2017-01-01 00:00:00" } }
    end
    @book = assigns(:book)
    assert_redirected_to @book
    follow_redirect!
    assert_not_empty "flash#notice"
    assert_equal @book.title, "some random book title"
    assert_equal @book.description, "some random book description"
    assert_equal @book.published_at, "2017-01-01 00:00:00"

    get edit_book_url(@book)
    assert_template "books/edit"
    patch book_url(@book), params: { book: { title: "changed book title", description: "changed book description", published_at: "2000-01-01 00:00:00" } }
    assert_redirected_to @book
    follow_redirect!
    assert_not_empty "flash#notice"
    @book.reload
    assert_equal @book.title, "changed book title"
    assert_equal @book.description, "changed book description"
    assert_equal @book.published_at, "2000-01-01 00:00:00"

    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end
    assert_redirected_to books_url
    follow_redirect!
    assert_not_empty "flash#notice"
  end



end
