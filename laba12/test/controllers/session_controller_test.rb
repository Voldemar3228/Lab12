require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = { email: 'test@mail.com', password: 'qwerty' }
  end

  test "should get login" do
    get session_login_url
    assert_response :success
  end

  test "cant_calculate_without_auto" do
    get lr8_logic_output_url, params: { v1: 7 }
    assert_response :redirect
  end

  test "should_registrate_before_calculations" do
    post users_url, params: { user: { email: @user[:email], password: @user[:password] }}
    get lr8_logic_input_url
    assert_response :success
  end

  test "signin_and_calculate" do
    post users_url, params: { user: { email: @user[:email], password: @user[:password] }}
    get session_logout_path
    post session_create_path, params: { email: @user[:email], password: @user[:password] }
    get lr8_logic_output_path, params: { v1: 12 }
    assert_response :success
    refute assigns(:mean).nil?
  end

end
