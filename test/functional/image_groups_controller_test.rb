require 'test_helper'

class ImageGroupsControllerTest < ActionController::TestCase
  setup do
    @image_group = image_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_group" do
    assert_difference('ImageGroup.count') do
      post :create, image_group: { category: @image_group.category, cover_image_id: @image_group.cover_image_id, desc: @image_group.desc, enabled: @image_group.enabled, group_name: @image_group.group_name, key_word: @image_group.key_word, weight_factor: @image_group.weight_factor }
    end

    assert_redirected_to image_group_path(assigns(:image_group))
  end

  test "should show image_group" do
    get :show, id: @image_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_group
    assert_response :success
  end

  test "should update image_group" do
    put :update, id: @image_group, image_group: { category: @image_group.category, cover_image_id: @image_group.cover_image_id, desc: @image_group.desc, enabled: @image_group.enabled, group_name: @image_group.group_name, key_word: @image_group.key_word, weight_factor: @image_group.weight_factor }
    assert_redirected_to image_group_path(assigns(:image_group))
  end

  test "should destroy image_group" do
    assert_difference('ImageGroup.count', -1) do
      delete :destroy, id: @image_group
    end

    assert_redirected_to image_groups_path
  end
end
