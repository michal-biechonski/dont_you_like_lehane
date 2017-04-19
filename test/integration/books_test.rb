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
    assert_select "div#flash_alert", "You must be logged in to do that."
    assert_not logged_in?
    
    post user_session_url, params: { user: { email: @user.email, password: "password" } }
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice", "Signed in successfully."
    assert logged_in?
    get new_book_url
    assert_redirected_to users_url
    follow_redirect!
    assert_select "div#flash_alert", "Only administrators have access to do this task."
    delete destroy_user_session_url
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice", "Signed out successfully."
    assert_not logged_in?
    
    get new_user_session_url
    post user_session_url, params: { user: { email: @admin.email, password: "password" } }
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice", "Signed in successfully."
    assert logged_in?
    get new_book_url
    assert_template "books/new"
    assert_difference("Book.count", 1) do
      post books_url, params: { book: { title: "some random book title", description: "some random book description", published_at: "2017-01-01 00:00:00" } }
    end
    @book = assigns(:book)
    assert_redirected_to @book
    follow_redirect!
    assert_select "div#flash_notice", "Book was successfully created."
    assert_equal @book.title, "some random book title"
    assert_equal @book.description, "some random book description"
    assert_equal @book.published_at, "2017-01-01 00:00:00"

    assert_no_difference("Book.count") do
      post books_url, params: { book: { title: "some random book title", description: "", published_at: "" } }
    end
    assert_select "div#error_explanation", count: 1

    get edit_book_url(@book)
    assert_template "books/edit"
    patch book_url(@book), params: { book: { title: "changed book title", description: "changed book description", published_at: "2000-01-01 00:00:00" } }
    assert_redirected_to @book
    follow_redirect!
    assert_select "div#flash_notice", "Book was successfully updated."
    @book.reload
    assert_equal @book.title, "changed book title"
    assert_equal @book.description, "changed book description"
    assert_equal @book.published_at, "2000-01-01 00:00:00"

    patch book_url(@book), params: { book: { title: "", description: "", published_at: "" } }
    assert_select "div#error_explanation", count: 1

    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end
    assert_redirected_to books_url
    follow_redirect!
    assert_select "div#flash_notice", "Book was successfully deleted."
  end

  test "add and delete readers and future readers" do
    get new_user_session_url
    post user_session_url, params: { user: { email: @user.email, password: "password" } }
    assert logged_in?
    get book_url(books(:four))
    assert_template "books/show"
    assert_select "form[action=?]", book_readers_path(books(:four))
    assert_select "form[action=?]", book_future_readers_path(books(:four))
    assert_difference("Reader.count", 1) do
      post book_readers_path(books(:four))
    end
    get book_url(books(:four))
    assert_select "a[href=?]", book_reader_path(books(:four), @user)
    assert_select "form[action=?]", book_future_readers_path(books(:four))
    assert_difference("FutureReader.count", 1) do
      assert_difference("Reader.count", -1) do
        post book_future_readers_path(books(:four))
      end
    end
    get book_url(books(:four))
    assert_select "form[action=?]", book_readers_path(books(:four))
    assert_select "a[href=?]", book_future_reader_path(books(:four), @user)
    assert_difference("Reader.count", 1) do
      assert_difference("FutureReader.count", -1) do
        post book_readers_path(books(:four))
      end
    end
    assert_difference("Reader.count", -1) do
      delete book_reader_path(books(:four), @user)
    end
    get book_url(books(:four))
    assert_select "form[action=?]", book_readers_path(books(:four))
    assert_select "form[action=?]", book_future_readers_path(books(:four))
  end



end
