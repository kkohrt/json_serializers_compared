require "test_helper"

class PhonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phone = phones(:one)
  end

  test "should get index" do
    get phones_url, as: :json
    assert_response :success
  end

  test "should create phone" do
    assert_difference('Phone.count') do
      post phones_url, params: { phone: { can_call: @phone.can_call, can_text: @phone.can_text, classification: @phone.classification, disabled_at: @phone.disabled_at, extension: @phone.extension, nickname: @phone.nickname, number: @phone.number, phonable_id: @phone.phonable_id, phonable_type: @phone.phonable_type, priority: @phone.priority, shared: @phone.shared } }, as: :json
    end

    assert_response 201
  end

  test "should show phone" do
    get phone_url(@phone), as: :json
    assert_response :success
  end

  test "should update phone" do
    patch phone_url(@phone), params: { phone: { can_call: @phone.can_call, can_text: @phone.can_text, classification: @phone.classification, disabled_at: @phone.disabled_at, extension: @phone.extension, nickname: @phone.nickname, number: @phone.number, phonable_id: @phone.phonable_id, phonable_type: @phone.phonable_type, priority: @phone.priority, shared: @phone.shared } }, as: :json
    assert_response 200
  end

  test "should destroy phone" do
    assert_difference('Phone.count', -1) do
      delete phone_url(@phone), as: :json
    end

    assert_response 204
  end
end
