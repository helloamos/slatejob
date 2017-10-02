require 'test_helper'

class TimeUnitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_unity = time_unities(:one)
  end

  test "should get index" do
    get time_unities_url
    assert_response :success
  end

  test "should get new" do
    get new_time_unity_url
    assert_response :success
  end

  test "should create time_unity" do
    assert_difference('TimeUnity.count') do
      post time_unities_url, params: { time_unity: { title: @time_unity.title } }
    end

    assert_redirected_to time_unity_url(TimeUnity.last)
  end

  test "should show time_unity" do
    get time_unity_url(@time_unity)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_unity_url(@time_unity)
    assert_response :success
  end

  test "should update time_unity" do
    patch time_unity_url(@time_unity), params: { time_unity: { title: @time_unity.title } }
    assert_redirected_to time_unity_url(@time_unity)
  end

  test "should destroy time_unity" do
    assert_difference('TimeUnity.count', -1) do
      delete time_unity_url(@time_unity)
    end

    assert_redirected_to time_unities_url
  end
end
