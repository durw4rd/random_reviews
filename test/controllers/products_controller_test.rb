require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get Users" do
    get :Users
    assert_response :success
  end

  test "should get Reviews" do
    get :Reviews
    assert_response :success
  end

end
