require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "check the '1st_Category' description" do
    category_first = Category.find_by(name: '1st_Category')
    assert_equal("1st_description", category_first.description)
  end

  # test "return false if name is missed" do
  #   new_category = Category.new(description: "some description")
  #   assert_not(new_category.valid?)
  # end

  # test "return true if everything is good" do
  #   new_category = Category.new(name: "some name", description: "some description")
  #   assert(new_category.valid?)
  # end

  # test "saving and gethering" do
  #   new_category = Category.new(name: "new category", description: "new description")
  #   new_category.save()
  #   new_cat = Category.find_by(name: "new category")
  #   assert_equal("new description", new_cat.description)
  # end
end
