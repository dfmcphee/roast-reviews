require 'test_helper'

class RoastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roaster = roasters(:one)
    @user = users(:one)
  end

  test "should get index" do
    get roasters_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_roaster_url
    assert_response :success
  end

  test "should create roaster" do
    sign_in @user
    assert_difference('Roaster.count') do
      post roasters_url, params: { roaster: { description: @roaster.description, location: @roaster.location, name: @roaster.name } }
    end

    assert_redirected_to roaster_url(Roaster.last)
  end

  test "should show roaster" do
    get roaster_url(@roaster)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_roaster_url(@roaster)
    assert_response :success
  end

  test "should update roaster" do
    sign_in @user
    patch roaster_url(@roaster), params: { roaster: { description: @roaster.description, location: @roaster.location, name: @roaster.name } }
    assert_redirected_to roaster_url(@roaster)
  end

  test "should destroy roaster" do
    sign_in @user
    assert_difference('Roaster.count', -1) do
      delete roaster_url(@roaster)
    end

    assert_redirected_to roasters_url
  end
end
