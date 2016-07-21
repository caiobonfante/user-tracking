require 'test_helper'

class AccessesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accesses_index_url
    assert_response :success
  end

  test "should get show" do
    get accesses_show_url
    assert_response :success
  end

  test "should get create" do
    get accesses_create_url
    assert_response :success
  end

end
