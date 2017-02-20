require 'test_helper'

class BeansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bean = beans(:one)
  end

  test "should get index" do
    get beans_url
    assert_response :success
  end

  test "should get new" do
    get new_bean_url
    assert_response :success
  end

  test "should create bean" do
    assert_difference('Bean.count') do
      post beans_url, params: { bean: { description: @bean.description, name: @bean.name, roast: @bean.roast } }
    end

    assert_redirected_to bean_url(Bean.last)
  end

  test "should show bean" do
    get bean_url(@bean)
    assert_response :success
  end

  test "should get edit" do
    get edit_bean_url(@bean)
    assert_response :success
  end

  test "should update bean" do
    patch bean_url(@bean), params: { bean: { description: @bean.description, name: @bean.name, roast: @bean.roast } }
    assert_redirected_to bean_url(@bean)
  end

  test "should destroy bean" do
    assert_difference('Bean.count', -1) do
      delete bean_url(@bean)
    end

    assert_redirected_to beans_url
  end
end
