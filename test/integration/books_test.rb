require 'test_helper'

class BooksTest < ActionDispatch::IntegrationTest

  test "add, edit, delete books" do
    sign_in users(:one)
  end



end
