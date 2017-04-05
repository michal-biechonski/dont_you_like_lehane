require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest

  setup do
    @book = books(:one)
    @user = users(:one)
    @admin = users(:admin)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should redirect when get new" do
    get new_book_url
    assert_response :redirect
  end

  test "should redirect when user not admin" do
    sign_in @user
    get new_book_path
    assert_response :redirect
  end

  test "should get new when user admin" do
    sign_in @admin
    get new_book_path
    assert_response :success
  end

  test "should create book when user admin" do
    sign_in @admin
    assert_difference('Book.count', 1) do
      post books_url, params: { book: { description: "some random text description", title: "some random title", published_at: "2010-02-11 11:02:57" } }
    end
    assert_redirected_to book_url(Book.last)
  end

  test "should not create book when user not admin or not logged in" do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { description: "some random text description", title: "some random title", published_at: "2010-02-11 11:02:57" } }
    end
    assert_redirected_to new_user_session_url

    sign_in @user
    assert_no_difference('Book.count') do
      post books_url, params: { book: { description: "some random text description", title: "some random title", published_at: "2010-02-11 11:02:57" } }
    end
    assert_redirected_to users_url
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit when user admin" do
    sign_in @admin
    get edit_book_url(@book)
    assert_response :success
  end

  test "should not get edit when user not admin or not logged in" do
    get edit_book_url(@book)
    assert_redirected_to new_user_session_url

    sign_in @user
    get edit_book_url(@book)
    assert_redirected_to users_url
  end

  test "should update book when user admin" do
    sign_in @admin
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should not update book when user not admin or not logged in" do
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, title: @book.title } }
    assert_redirected_to new_user_session_url
    
    sign_in @user
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, title: @book.title } }
    assert_redirected_to users_url
  end

  test "should destroy book when user admin" do
    sign_in @admin
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end
    assert_redirected_to books_url
  end

  test "should not destroy book when user not admin or not logged in" do
    assert_no_difference('Book.count') do
      delete book_url(@book)
    end
    assert_redirected_to new_user_session_url
    
    sign_in @user
    assert_no_difference('Book.count') do
      delete book_url(@book)
    end
    assert_redirected_to users_url
  end

end
