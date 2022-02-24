require "test_helper"

class CommandsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get commands_create_url
    assert_response :success
  end

  test "should get valid_slack_token" do
    get commands_valid_slack_token_url
    assert_response :success
  end

  test "should get command_params" do
    get commands_command_params_url
    assert_response :success
  end
end
