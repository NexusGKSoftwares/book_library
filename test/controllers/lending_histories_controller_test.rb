require "test_helper"

class LendingHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lending_histories_new_url
    assert_response :success
  end

  test "should get create" do
    get lending_histories_create_url
    assert_response :success
  end
end
