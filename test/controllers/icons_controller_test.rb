require "test_helper"

class IconsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @icon = icons(:one)
  end

  test "should get index" do
    get icons_url, as: :json
    assert_response :success
  end

  test "should create icon" do
    assert_difference('Icon.count') do
      post icons_url, params: { icon: { created: @icon.created, height: @icon.height, history: @icon.history, image: @icon.image, name: @icon.name } }, as: :json
    end

    assert_response 201
  end

  test "should show icon" do
    get icon_url(@icon), as: :json
    assert_response :success
  end

  test "should update icon" do
    patch icon_url(@icon), params: { icon: { created: @icon.created, height: @icon.height, history: @icon.history, image: @icon.image, name: @icon.name } }, as: :json
    assert_response 200
  end

  test "should destroy icon" do
    assert_difference('Icon.count', -1) do
      delete icon_url(@icon), as: :json
    end

    assert_response 204
  end
end
