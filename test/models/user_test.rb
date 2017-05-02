require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name is necessary" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name has to have min 3 characters" do
    @user.name = "aa"
    assert_not @user.valid?
  end

  test "email should be valid" do
    @user.email = "random.text"
    assert_not @user.valid?
  end

  test "password is necessary" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "password confirmation is necessary" do
    @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "password and password_confirmation have to be the same" do
    @user.password = "randomText"
    @user.password_confirmation = "Textrandom"
    assert_not @user.valid?
  end
end
