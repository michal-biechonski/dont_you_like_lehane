require "test_helper"

class LayoutTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "main page layout" do
    get root_url
    assert_not logged_in?
    assert_template "pages/home"
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", books_path
    assert_select "a[href=?]", posts_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", new_user_registration_path, count: 2
    assert_select "a[href=?]", "books/1"
    assert_select "a[href=?]", "books/2"
    assert_select "a[href=?]", "books/3"
    assert_select "a[href=?]", new_book_path, count: 0
    assert_select "a[href=?]", new_user_post_path(@user), count: 0
    assert_select "a[data-toggle=?]", "dropdown", count: 0
    assert_select "a[href=?]", destroy_user_session_path, count: 0
    assert_select "a[href=?]", edit_user_registration_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
    get new_user_session_path
    assert_template "users/sessions/new"
    post(
      user_session_path,
      params: { user: { email: @user.email, password: "password" } }
    )
    assert_redirected_to root_path
    follow_redirect!
    assert_select "div#flash_notice", "Signed in successfully."
    assert logged_in?
    assert_select "a[href=?]", new_user_session_path, count: 0
    assert_select "a[href=?]", new_user_registration_path, count: 0
    assert_select "a[data-toggle=?]", "dropdown"
    assert_select "a[href=?]", destroy_user_session_path
    assert_select "a[href=?]", edit_user_registration_path
    assert_select "a[href=?]", user_path(@user)
  end
end
