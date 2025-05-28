require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup #metodo especial que se ejecuta para todas las pruebas
    @category = Category.new(name: "sports")
  end
  test "category should be valid" do #test es una macro de rails equivales a def test_category_should_be_valid
    assert @category.valid? #verifica que la condicion sea true
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid? 
  end

  test "name should not be too long" do
    @category.name = "a"*26
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
end