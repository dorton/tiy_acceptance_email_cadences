require 'test_helper'

class CodeChallengesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @code_challenge = code_challenges(:one)
  end

  test "should get index" do
    get code_challenges_url
    assert_response :success
  end

  test "should get new" do
    get new_code_challenge_url
    assert_response :success
  end

  test "should create code_challenge" do
    assert_difference('CodeChallenge.count') do
      post code_challenges_url, params: { code_challenge: { description: @code_challenge.description, newline_url: @code_challenge.newline_url } }
    end

    assert_redirected_to code_challenge_url(CodeChallenge.last)
  end

  test "should show code_challenge" do
    get code_challenge_url(@code_challenge)
    assert_response :success
  end

  test "should get edit" do
    get edit_code_challenge_url(@code_challenge)
    assert_response :success
  end

  test "should update code_challenge" do
    patch code_challenge_url(@code_challenge), params: { code_challenge: { description: @code_challenge.description, newline_url: @code_challenge.newline_url } }
    assert_redirected_to code_challenge_url(@code_challenge)
  end

  test "should destroy code_challenge" do
    assert_difference('CodeChallenge.count', -1) do
      delete code_challenge_url(@code_challenge)
    end

    assert_redirected_to code_challenges_url
  end
end
