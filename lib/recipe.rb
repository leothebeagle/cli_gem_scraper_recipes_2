class Recipe
  attr_accessor :name, :description, :url

  @@top_recipes = []

  def self.top_recipes
    # @@top_recipes
    recipe_1 = Recipe.new
    recipe_1.name = "pasta"
    recipe_1.description = "lovely pasta"
    recipe_1.url = "https://www.pasta.com"

    recipe_2 = Recipe.new
    recipe_2.name = "rice"
    recipe_2.description = "fluffy, Persian rice"
    recipe_2.url = "https://www.rice.com"

    recipe_3 = Recipe.new
    recipe_3.name = "meatballs"
    recipe_3.description = "Dawud Basha"
    recipe_3.url = "https://www.dawudbasha.com"

    [recipe_1, recipe_2, recipe_3]
  end

  def save
    self.class.top_recipes << self
  end

  def create_from_hash(recipe_hash) #you are given a recipe hash, which you will iterate over and instantiate new Recipe objects.
    recipe_hash.each do |recipe_name, recipe_attributes|
      recipe = Recipe.new
      recipe.name = recipe_name
      recipe.description = recipe_attributes[:description]
      recipe.url = recipe_attributes[:url]
      recipe.save
    end

  end
end




# recipes = {
#   :pasta => {:description => "lovely pasta", :url => "https://www.pasta.com"},
#   :rice => {:description => "fluffy, Persian rice", :url => "https://www.rice.com"},
#   :meatballs => {:description => "Dawud Basha", :url => "https://www.dawudbasha.com"}
# }
