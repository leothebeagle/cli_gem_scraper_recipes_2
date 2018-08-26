class CliController

  def call
    puts "Hi, there. Welcome to the recipe app!!The top recipes for this week are:"
    list_recipes
  end

  def list_recipes
    @recipes = Recipe.top_recipes

    @recipes.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.name} - #{recipe.description} - #{recipe.url}"
    end
  end


end
