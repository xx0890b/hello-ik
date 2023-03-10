require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get regist" do
    get messages_regist_url
    assert_response :success
  end
end
