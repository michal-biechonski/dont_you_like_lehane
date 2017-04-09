require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    @admin = users(:admin)
  end

  test "should get index page" do
    get users_url
    assert_response :success
  end

  test "should get show page" do
    get user_url(@user)
    assert_response :success
  end

  test "should get login page" do
    get new_user_session_url
    assert_response :success
  end

  test "should not get login page if logged in" do
    sign_in @user
    get new_user_session_url
    assert_redirected_to root_url
  end

  test "should get signup page" do
    get new_user_registration_url
    assert_response :success
  end

  test "should not get signup page if logged in" do
    sign_in @user
    get new_user_registration_url
    assert_redirected_to root_url
  end

  test "should create user" do
    assert_difference("User.count", 1) do
      post user_registration_url, params: { user: { email: "random@email.com", name: "randomName", password: "password", password_confirmation: "password" } }
    end
    assert_redirected_to root_url
  end

  test "should not get edit if not logged in" do
    get edit_user_registration_url
    assert_redirected_to new_user_session_url
  end

  test "should get edit" do
    sign_in @user
    get edit_user_registration_url
    assert_response :success
  end

  test "should not update user if not logged in" do
    patch user_registration_url, params: { user: { current_password: "password", name: "someRandomName" } }
    assert_redirected_to new_user_session_url
  end

  test "should not update user if current password not valid" do
    sign_in @user
    patch user_registration_url, params: { user: { current_password: "randomText", name: "someRandomName" } }
    assert_select "div#error_explanation", "Current password is invalid"
  end

  test "should update user if current_password valid" do
    sign_in @user
    patch user_registration_url, params: { user: { current_password: "password", name: "someRandomName", password: "newpassword", password_confirmation: "newpassword" } }
    assert_redirected_to root_url
  end

  test "should not cancel user's own account if not logged in" do
    assert_no_difference("User.count") do
      delete user_registration_url
    end
    assert_redirected_to new_user_session_url
  end

  test "should cancel user's own account" do
    sign_in @user
    assert_difference("User.count", -1) do
      delete user_registration_url
    end
    assert_redirected_to root_url
  end

  test "should not delete other user's account if not logged in or user not admin" do
    assert_no_difference("User.count") do
      delete user_url(@admin)
    end
    assert_redirected_to new_user_session_url
    sign_in @user
    assert_no_difference("User.count") do
      delete user_url(@admin)
    end
    assert_redirected_to users_url
  end

  test "should delete other user's account if user admin" do
    sign_in @admin
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_url
  end


end
