require 'test_helper'

class UserLanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_language = user_languages(:one)
  end

  test "should get index" do
    get user_languages_url
    assert_response :success
  end

  test "should get new" do
    get new_user_language_url
    assert_response :success
  end

  test "should create user_language" do
    assert_difference('UserLanguage.count') do
      post user_languages_url, params: { user_language: { title: @user_language.title } }
    end

    assert_redirected_to user_language_url(UserLanguage.last)
  end

  test "should show user_language" do
    get user_language_url(@user_language)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_language_url(@user_language)
    assert_response :success
  end

  test "should update user_language" do
    patch user_language_url(@user_language), params: { user_language: { title: @user_language.title } }
    assert_redirected_to user_language_url(@user_language)
  end

  test "should destroy user_language" do
    assert_difference('UserLanguage.count', -1) do
      delete user_language_url(@user_language)
    end

    assert_redirected_to user_languages_url
  end
end
