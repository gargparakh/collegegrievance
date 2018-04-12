require 'test_helper'

class ComplaintChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @complaint_chat = complaint_chats(:one)
  end

  test "should get index" do
    get complaint_chats_url, as: :json
    assert_response :success
  end

  test "should create complaint_chat" do
    assert_difference('ComplaintChat.count') do
      post complaint_chats_url, params: { complaint_chat: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show complaint_chat" do
    get complaint_chat_url(@complaint_chat), as: :json
    assert_response :success
  end

  test "should update complaint_chat" do
    patch complaint_chat_url(@complaint_chat), params: { complaint_chat: {  } }, as: :json
    assert_response 200
  end

  test "should destroy complaint_chat" do
    assert_difference('ComplaintChat.count', -1) do
      delete complaint_chat_url(@complaint_chat), as: :json
    end

    assert_response 204
  end
end
