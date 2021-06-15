require "test_helper"

class ConsortiumControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consortium_index_url
    assert_response :success
  end

  test "should get new" do
    get consortium_new_url
    assert_response :success
  end

  test "should get create" do
    get consortium_create_url
    assert_response :success
  end

  test "should get edit" do
    get consortium_edit_url
    assert_response :success
  end

  test "should get update" do
    get consortium_update_url
    assert_response :success
  end

  test "should get destroy" do
    get consortium_destroy_url
    assert_response :success
  end
end
