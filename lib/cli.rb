class CliController

  def call
    puts ""
    puts "     ---------- Hi, there. Welcome to the recipe app!!The top recipes for this week are: ----------"
    puts ""
    Scraper.scrape_ba_recipes
    Scraper.scrape_recipe_instructions
    list_recipes
    menu
  end

  def list_recipes
    @recipes = Recipe.top_recipes

    @recipes.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.name} - #{recipe.description} - #{recipe.url}"
      puts ""
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "------- If you'd like more information on a recipe, type in the recipe number. To view the recipe list, type 'list' or type 'exit' -------"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i.between?(1, @recipes.length)
        the_recipe = @recipes[input.to_i - 1]
        selection = nil

        while selection != "exit"
          puts "You selected #{the_recipe.name}. To view the ingredients type 'ingredients' and to view the directions type 'directions' or type exit"
          selection = gets.strip.downcase
            if selection == 'ingredients'
              puts the_recipe.ingredients
            elsif selection == 'directions'
              puts the_recipe.directions
            elsif selection == "exit"
              break
            else
              puts "I'm sorry, I dont understand that"
            end
        end
        # puts "#{the_recipe.name} - #{the_recipe.description} - #{the_recipe.url}"
      elsif input == "list"
        list_recipes
      elsif input == "exit"
        break
      else
        puts "not sure what you want, enter the recipe number, list, or exit"
      end
    end
  end
end
