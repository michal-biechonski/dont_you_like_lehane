require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest

  setup do
    @first_user = users(:one)
    @first_admin = users(:admin)
    ActionMailer::Base.deliveries.clear
  end

  test "add, edit and delete users" do
    get new_user_registration_url
    assert_template "users/registrations/new"
    assert_select "h1", "Sign up"
    assert_select "input[type=?]", "email"
    assert_select "input[type=?]", "password"
    assert_select "a[href=?]", user_registration_path
    assert_difference("User.count", 1) do
      assert_difference("ActionMailer::Base.deliveries.count", 1) do
        post user_registration_url, params: { user: { email: "random@email.com", name: "random_name", password: "password", password_confirmation: "password" } }
      end
    end
    @new_user = assigns(:user)
    @mail = ActionMailer::Base.deliveries.last
    assert_equal ["do-not-reply@dont_you_like_lehane.com"], @mail.from 
    assert_equal [@new_user.email], @mail.to 
    assert_equal "Confirmation instructions", @mail.subject 
    assert_match @new_user.confirmation_token, @mail.body.encoded
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice", "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
    assert_nil @new_user.confirmed_at

    get user_confirmation_url, params: { confirmation_token: @new_user.confirmation_token}
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_select "div#flash_notice", "Your email address has been successfully confirmed."
    @new_user.reload
    assert_not_nil @new_user.confirmed_at

    get new_user_session_url
    post user_session_url, params: { user: { email: @new_user.email, password: "password" } }
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice", "Signed in successfully."
    assert logged_in?

    delete destroy_user_session_url
    get new_user_session_url
    assert_not logged_in?
    2.times do
      post user_session_url, params: { user: { email: @new_user.email, password: "wrong_password" } }
    end
    assert_select "div#flash_alert", "You have one more attempt before your account is locked."
    post user_session_url, params: { user: { email: @new_user.email, password: "wrong_password" } }
    assert_select "div#flash_alert", "Your account is locked."
    assert_not logged_in?

    get new_user_session_url
    post user_session_url, params: { user: { email: @new_user.email, password: "password" } }
    assert_select "div#flash_alert", "Your account is locked."
    assert_not logged_in?

  end




end
