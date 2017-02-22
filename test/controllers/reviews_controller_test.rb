require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = reviews(:one)
    @user = users(:one)
  end

  test "should get index" do
    get reviews_url
    assert_response :success
  end

  test "should get mine" do
    sign_in @user
    get user_reviews_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_review_url, params: {
      beans_id: 1
    }
    assert_response :success
  end

  test "should create review" do
    sign_in @user
    assert_difference('Review.count') do
      post reviews_url, params: { review: { bitter: @review.bitter, notes: @review.notes, rating: @review.rating, roast: @review.roast, salty: @review.salty, sour: @review.sour, sweet: @review.sweet } }
    end

    assert_redirected_to review_url(Review.last)
  end

  test "should show review" do
    get review_url(@review)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_review_url(@review)
    assert_response :success
  end

  test "should update review" do
    sign_in @user
    patch review_url(@review), params: {
      review: {
        bitter: @review.bitter,
        notes: @review.notes,
        rating: @review.rating,
        roast: @review.roast,
        salty: @review.salty,
        sour: @review.sour,
        sweet: @review.sweet
      }
    }
    assert_redirected_to review_url(@review)
  end

  test "should destroy review" do
    sign_in @user
    assert_difference('Review.count', -1) do
      delete review_url(@review)
    end

    assert_redirected_to reviews_url
  end
end
