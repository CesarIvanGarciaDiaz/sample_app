require 'test_helper'

class HistoryMovementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get history_movements_index_url
    assert_response :success
  end

  test "should get download" do
    get history_movements_download_url
    assert_response :success
  end

end
