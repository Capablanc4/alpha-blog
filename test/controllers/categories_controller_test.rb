require 'test_helper'
class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @category = Category.create(name: "sports")
    @user = User.create(username: "Abel", email: "hola@mundo.com", password:"pas123456", admin: true)
  end
  test "should get categories index" do
    get categories_path
    assert_response :success
  end

  test "should get new category" do
    sign_in_as(@user)
    get new_category_path
    assert_response :success
  end

  test "should get show category" do
    get category_path(@category)
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference "Category.count" do
      post categories_path, params: { category: { name: "sports" } }
    end
    assert_redirected_to categories_path
  end
end
