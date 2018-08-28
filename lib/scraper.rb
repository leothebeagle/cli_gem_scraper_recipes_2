
class Scraper #here is where you will pull the data and put it into a hash format. the hash will then be used by Recipe to instantiate new recipe objects

  def self.scrape_ba_recipes
    bonappetit_recipes = Nokogiri::HTML(open("https://www.bonappetit.com/recipes"))
    recipes = {}

    bonappetit_recipes.css("ul.cards li.cards__li").each do |recipe|
      recipe_name = recipe.css("h1.card-hed").text
      recipes[recipe_name.to_sym] = {
        :description => recipe.css("div.card-body p.card-copy").text,
        :url => "https://www.bonappetit.com/" + recipe.css("h1.card-hed a").attribute("href").value
      }
    end
    recipes
  end

  def self.scrape_recipe_instructions(recipe_url) #this is a method that'll extract instructions for a single recipe. this method will actually get called by another metho in Recipe.
    recipe_instructions = Nokogiri::HTML(open(recipe_url))
    instructions = { :ingredients => [], :directions => "" }

    # instructions[:steps] = recipe_directions.css("ul.steps li.step p").text #fetches the instructions and places them in the hash
    instructions[:directions] = recipe_instructions.css("li.step p").text #there are several formats to the recipes. some have gifs and ordered lists whereas others are input as unordered lists.

    recipe_instructions.css("ul.ingredients__group li.ingredient").each do |ingredient| #the initial css selector gets all the ingredient blocks. it then extracts the text and pushes that into the ingredients array in the instructions hash
      instructions[:ingredients] << ingredient.text
    end
    instructions
  end
end
