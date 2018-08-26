class CliController

  def call
    puts "Hi, there. Welcome to the recipe app!!The top recipes for this week are:"
    list_recipes
    menu
  end

  def list_recipes
    @recipes = Recipe.top_recipes

    @recipes.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.name} - #{recipe.description} - #{recipe.url}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "If you'd like the ingredient list for a recipe, type in the recipe number. To view the recipe list, type list or type exit"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i.between?(1, @recipes.length)
        puts @recipes[input.to_i - 1]
      elsif input == "list"
        list_recipes
      else
        puts "not sure what you want, enter the recipe number, list, or exit"
      end
    end
  end
end
