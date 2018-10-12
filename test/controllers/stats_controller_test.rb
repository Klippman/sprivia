require 'test_helper'

class StatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stats_index_url
    assert_response :success
  end

  test "should get show" do
    get stats_show_url
    assert_response :success
  end

end
