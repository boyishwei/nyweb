require 'test_helper'

class PubControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
