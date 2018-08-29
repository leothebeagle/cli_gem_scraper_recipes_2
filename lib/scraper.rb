
class Scraper #here is where you will pull the data and put it into a hash format. the hash will then be used by Recipe to instantiate new recipe objects

  def self.scrape_ba_recipes
    bonappetit_recipes = Nokogiri::HTML(open("https://www.bonappetit.com/recipes"))

    bonappetit_recipes.css("ul.cards li.cards__li").each do |recipe|
      new_recipe = Recipe.new
      new_recipe.name = recipe.css("h1.card-hed").text
      new_recipe.description = recipe.css("div.card-body p.card-copy").text
      new_recipe.url = "https://www.bonappetit.com/" + recipe.css("h1.card-hed a").attribute("href").value
      new_recipe.save
    end

  end

  def self.scrape_recipe_instructions #this is a method that'll extract instructions for a single recipe.
    Recipe.top_recipes.each do |recipe|
      recipe_url = recipe.url
      recipe.ingredients = []

      recipe_instructions = Nokogiri::HTML(open(recipe_url))
      recipe.directions = recipe_instructions.css("li.step p").text

      recipe_instructions.css("ul.ingredients__group li.ingredient").each do |ingredient|
        recipe.ingredients << ingredient.text
      end
    end
  end
end
