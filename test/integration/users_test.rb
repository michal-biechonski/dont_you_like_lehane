require "test_helper"

class UsersTest < ActionDispatch::IntegrationTest
  setup do
    @first_user = users(:one)
    @first_admin = users(:admin)
    # ActionMailer::Base.deliveries.clear
    # TODO: ActionMailer::Base doesn't deliver activation emails, probably cause email activation was turned off, confirm it!!!
  end

  test "add, edit and delete users" do
    get new_user_registration_url
    assert_template "users/registrations/new"
    assert_select "h1", "Sign up"
    assert_select "input[type=?]", "email"
    assert_select "input[type=?]", "password"
    assert_select "a[href=?]", user_registration_path
    assert_difference [
      "User.count",
      # "ActionMailer::Base.deliveries.count"
    ], 1 do
      post(
        user_registration_url,
        params: {
          user: {
            email: "random@email.com",
            name: "random_name",
            password: "password",
            password_confirmation: "password"
          }
        }
      )
    end
    @new_user = assigns(:user)
    @mail = ActionMailer::Base.deliveries.last
    assert_equal ["do-not-reply@dont_you_like_lehane.com"], @mail.from
    assert_equal [@new_user.email], @mail.to
    assert_equal "Confirmation instructions", @mail.subject
    assert_match @new_user.confirmation_token, @mail.body.encoded
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice",
                  "A message with a confirmation link has been sent to your"\
                  " email address. Please follow the link to activate your"\
                  " account."
    @new_user.reload
    assert_nil @new_user.confirmed_at

    get(
      user_confirmation_url,
      params: { confirmation_token: @new_user.confirmation_token }
    )
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_select "div#flash_notice",
                  "Your email address has been successfully confirmed."
    @new_user.reload
    assert_not_nil @new_user.confirmed_at
    assert_equal @new_user.name, "random_name"
    assert_equal @new_user.email, "random@email.com"

    get new_user_session_url
    post(
      user_session_url,
      params: {
        user: {
          email: @new_user.email,
          password: "password"
        }
      }
    )
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice", "Signed in successfully."
    assert logged_in?

    delete destroy_user_session_url
    get new_user_session_url
    assert_not logged_in?
    2.times do
      post(
        user_session_url,
        params: {
          user: {
            email: @new_user.email,
            password: "wrong_password"
          }
        }
      )
    end
    @new_user.reload
    assert_equal 2, @new_user.failed_attempts
    assert_select "div#flash_alert",
                  "You have one more attempt before your account is locked."
    assert_difference("ActionMailer::Base.deliveries.count", 1) do
      post(
        user_session_url,
        params: { user: { email: @new_user.email, password: "wrong_password" } }
      )
    end
    assert_select "div#flash_alert", "Your account is locked."
    assert_not logged_in?
    @new_user.reload
    assert_not_nil @new_user.locked_at

    @mail = ActionMailer::Base.deliveries.last
    assert_equal ["do-not-reply@dont_you_like_lehane.com"], @mail.from
    assert_equal [@new_user.email], @mail.to
    assert_equal "Unlock instructions", @mail.subject
    assert_match "unlock_token=", @mail.body.encoded
    @email_token = @mail.body.match(/unlock_token=([^"]+)/)[1]
    @email_token_digest = Devise.token_generator.digest(
      self,
      :unlock_token,
      @email_token
    )
    assert_equal @email_token_digest, @new_user.unlock_token

    get new_user_session_url
    post(
      user_session_url,
      params: { user: { email: @new_user.email, password: "password" } }
    )
    assert_select "div#flash_alert", "Your account is locked."
    assert_not logged_in?
    get user_unlock_url, params: { unlock_token: @email_token }
    assert_redirected_to new_user_session_url
    follow_redirect!
    assert_select "div#flash_notice",
                  "Your account has been unlocked successfully. "\
                  "Please sign in to continue."
    @new_user.reload
    assert_nil @new_user.locked_at
    assert_nil @new_user.unlock_token
    assert_equal @new_user.failed_attempts, 0

    get new_user_session_url
    post(
      user_session_url,
      params: { user: { email: @new_user.email, password: "password" } }
    )
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice", "Signed in successfully."
    assert logged_in?

    get edit_user_registration_url
    assert_template("users/registrations/edit")
    assert_difference("ActionMailer::Base.deliveries.count", 1) do
      patch(
        user_registration_url,
        params: {
          user: {
            current_password: "password",
            email: "new_email@example.com",
            name: "my_new_name",
            password: "passwordpassword",
            password_confirmation: "passwordpassword"
          }
        }
      )
    end
    @new_user.reload
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice",
                  "You updated your account successfully, but we need to "\
                  "verify your new email address. Please check your email and"\
                  " follow the confirm link to confirm your new email address."
    @mail = ActionMailer::Base.deliveries.last
    assert_equal @mail.subject, "Confirmation instructions"
    assert_match @new_user.confirmation_token, @mail.body.encoded

    get(
      user_confirmation_url,
      params: {
        confirmation_token: @new_user.confirmation_token
      }
    )
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice",
                  "Your email address has been successfully confirmed."
    @new_user.reload
    assert_equal @new_user.email, "new_email@example.com"
    assert_equal @new_user.name, "my_new_name"

    assert_no_difference("User.count") do
      delete user_url(@first_user)
    end
    assert_redirected_to users_url
    follow_redirect!
    assert_select "div#flash_alert",
                  "Only administrators have access to do this task."
    delete destroy_user_session_url
    assert_not logged_in?

    get new_user_session_url
    post(
      user_session_url,
      params: {
        user: {
          email: @first_admin.email,
          password: "password"
        }
      }
    )
    assert_redirected_to root_url
    follow_redirect!
    assert_select "div#flash_notice", "Signed in successfully."
    assert logged_in?

    assert_difference("User.count", -1) do
      delete user_url(@first_user)
    end
    assert_redirected_to users_url
    follow_redirect!
    assert_select "div#flash_notice", "User was successfully deleted."
  end
end
