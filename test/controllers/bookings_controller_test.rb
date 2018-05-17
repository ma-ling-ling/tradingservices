require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get provider_history" do
    get bookings_provider_history_url
    assert_response :success
  end

  test "should get recipient_history" do
    get bookings_recipient_history_url
    assert_response :success
  end

end
