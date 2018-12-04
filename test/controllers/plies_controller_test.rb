require 'test_helper'

class PliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plies_index_url
    assert_response :success
  end

  test "should get show" do
    get plies_show_url
    assert_response :success
  end

  test "should get edit" do
    get plies_edit_url
    assert_response :success
  end

  test "should get new" do
    get plies_new_url
    assert_response :success
  end

end
