require 'test_helper'
class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    # 1. Visita formulario
    get new_category_path
    assert_response :success
    assert_select 'form[action=?]', categories_path
    
    # 2. Envía datos y verifica creación
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "sports" } }
    end
    
    # 3. Verifica redirección
    assert_redirected_to categories_path
    follow_redirect!
    
    # 4. Verifica resultado final
    assert_response :success
    assert_select 'body', text: /sports/
  end

  test "invalid category submission results in failure" do
    get new_category_path
    assert_response :success
    assert_select 'form[action=?]', categories_path
    
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: " " } }
    end

    assert_response :success
    assert_select 'h4.alert-heading'
    assert_select 'ul.mb-0'
  end
end
