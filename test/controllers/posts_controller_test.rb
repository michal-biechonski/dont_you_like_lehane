 require "test_helper"

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
      post user_posts_url(
        @user,
        params: {
          post: {
            title: "Some random title",
            content: "Some random content "
          }
        }
      )
    end
    assert_redirected_to @user

    assert_no_difference("Post.count") do
      post user_posts_url(@user), params: { post: { title: "", content: "" } }
    end
    assert_select "div#error_explanation",
                  "Title can't be blank\nContent can't be blank"
  end

  test "should not create post if not logged in" do
    sign_out @user
    assert_no_difference("Post.count") do
      post user_posts_url(
        @user,
        params: { post: { title: "Random title", content: "random content" } }
      )
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

  test "should update post if post is valid" do
    patch user_post_url(
      @user, @first,
      params: {
        post: {
          title: "Some changed title",
          content: "Some changed content"
        }
      }
    )
    assert_redirected_to user_url(@user)

    patch user_post_url(
      @user, @first,
      params: { post: { title: "", content: "" } }
    )
    assert_select "div#error_explanation",
                  "Title can't be blank\nContent can't be blank"
  end

  test "should not update post if not logged in or not user's post" do
    patch user_post_url(
      @user, @third,
      params: { post: { title: "changed title", content: "changed content" } }
    )
    assert_redirected_to users_url
    follow_redirect!
    # FIXME: add selective messages someday
    # assert_select "div#flash_alert", "You can only do this to your own posts!"

    sign_out @user
    patch user_post_url(
      @user, @first,
      params: { post: { title: "changed title", content: "changed content" } }
    )
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_select "div#flash_alert", "You must be logged in to do that."
  end

  test "should delete post" do
    assert_difference("Post.count", -1) do
      delete user_post_url(@user, @first)
    end
    assert_redirected_to user_url(@user)
  end

  test "should not delete post if user not logged in" do
    sign_out @user
    assert_no_difference("Post.count") do
      delete user_post_url(@user, @first)
    end
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_select "div#flash_alert", "You must be logged in to do that."
  end

  test "should not delete if not user's post and user not admin" do
    assert_no_difference("Post.count") do
      delete user_post_url(users(:three), @third)
    end
    assert_redirected_to users_url
    follow_redirect!
    # assert_select "div#flash_alert", "You can only do this to your own posts!"
  end

  test "should delete any posts if user admin" do
    sign_out @user
    sign_in users(:admin)
    assert_difference("Post.count", -1) do
      delete user_post_url(users(:three), @third)
    end
    assert_redirected_to user_url(users(:admin))
    follow_redirect!
    assert_select "div#flash_notice", "You've deleted that post."
  end
end
