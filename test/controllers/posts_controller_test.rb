require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @first = posts(:first_user_post)
    @third = posts(:third_user_post)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    sign_out users(:one)
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_user_post_url(@user)
    assert_response :success
  end

  test "should not get new if not logged in" do
    sign_out @user
    get new_user_post_url(@user)
    assert_redirected_to new_user_session_url
  end

  test "should create post if post is valid" do
    assert_difference("Post.count", 1) do
      post user_posts_url(@user), params: { post: { title: "Some random title", content: "Some random content " } }
    end
    assert_redirected_to @user

    assert_no_difference("Post.count") do
      post user_posts_url(@user), params: { post: { title: "", content: "" } }
    end
    assert_not_empty "div#error_explanation"
  end

  test "should not create post if not logged in" do
    sign_out @user
    assert_no_difference("Post.count") do
      post user_posts_url(@user), params: { post: { title: "Random title", content: "random content" } }
    end
    assert_redirected_to new_user_session_url
  end

  test "should get edit" do
    get edit_user_post_url(@user, @first)
    assert_response :success
  end

  test "should not get edit if not logged in or not user's comment" do
    get edit_user_post_url(users(:three), @third)
    assert_redirected_to users_url
    sign_out @user
    get edit_user_post_url(users(:three), @third)
    assert_redirected_to new_user_session_url
  end

end
