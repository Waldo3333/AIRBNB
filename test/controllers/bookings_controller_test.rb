require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookings_new_url
    assert_response :success
  end

  test "should get create" do
    get bookings_create_url
    assert_response :success
  end

  test "should get update" do
    get bookings_update_url
    assert_response :success
  end

  test "should get delete" do
    get bookings_delete_url
    assert_response :success
  end
end
