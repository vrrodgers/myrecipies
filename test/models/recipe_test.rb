require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @recipe = Recipe.new(name: "vegetable", description: "great vegetable recipe")
  end
  

  test "recipe should be vaild" do 
    assert @recipe.valid?
    
  end

  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end
end    