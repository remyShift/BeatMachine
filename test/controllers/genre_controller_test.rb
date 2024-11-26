require "test_helper"

class GenreControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get genre_name_url
    assert_response :success
  end

  test "should get references:drumrack" do
    get genre_references:drumrack_url
    assert_response :success
  end
end
