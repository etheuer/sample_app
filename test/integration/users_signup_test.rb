require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {  name: "",
                                email: "user@invalid",
                                password:             "foo",
                                password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end

  test "Successful signup" do
    get signup_path
    assert_difference 'User.count', 1 do
      # 'post_via_redirect' method: Allows to make an HTTP POST request and follow any subsequent redirects.
      post_via_redirect users_path, user: {  name: "Test User",
                                email: "user@example.com",
                                password:             "foobar",
                                password_confirmation: "foobar" }
    end
    assert_template 'users/show'
  end


end
