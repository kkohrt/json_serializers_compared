require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get addresses_url, as: :json
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post addresses_url, params: { address: { addressable_id: @address.addressable_id, addressable_type: @address.addressable_type, city: @address.city, deleted_at: @address.deleted_at, postal_code: @address.postal_code, state_or_region: @address.state_or_region, street_1: @address.street_1, street_2: @address.street_2 } }, as: :json
    end

    assert_response 201
  end

  test "should show address" do
    get address_url(@address), as: :json
    assert_response :success
  end

  test "should update address" do
    patch address_url(@address), params: { address: { addressable_id: @address.addressable_id, addressable_type: @address.addressable_type, city: @address.city, deleted_at: @address.deleted_at, postal_code: @address.postal_code, state_or_region: @address.state_or_region, street_1: @address.street_1, street_2: @address.street_2 } }, as: :json
    assert_response 200
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete address_url(@address), as: :json
    end

    assert_response 204
  end
end
