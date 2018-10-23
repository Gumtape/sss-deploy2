require 'test_helper'

class CourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cources_index_url
    assert_response :success
  end

  test "should get show" do
    get cources_show_url
    assert_response :success
  end

  test "should get create" do
    get cources_create_url
    assert_response :success
  end

end
