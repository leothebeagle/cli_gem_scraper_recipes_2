
class Scraper #here is where you will pull the data and put it into a hash format. the hash will then be used by Recipe to instantiate new recipe objects

  def self.scrape_ba_recipes
    bonappetit_recipes = Nokogiri::HTML(open("https://www.bonappetit.com/recipes"))
    recipes = {}

    bonappetit_recipes.css("ul.cards li.cards__li").each do |recipe|
      recipe_name = recipe.css("h1.card-hed").text
      recipes[recipe_name.to_sym] = {
        :description => recipe.css("div.card-body p.card-copy").text,
        :url => "https://www.bonapetit.com/" + recipe.css("h1.card-hed a").attribute("href").value
      }
    end
    recipes
  end

  def self.scrape_recipe_directions(recipe_url) #this is a method that'll extract instructions for a single recipe. this method will actually get called by another metho in Recipe.
    recipe_directions = Nokogiri::HTML(open(recipe_url))

    instructions = { :ingredients => [], :steps => "" }

    #ingredients selector and then each of them gets pushed into the ingredients array. instructions[:ingredients] << ingredient
    #scrape the ingredients and then push them into an array
    #scrape instructions as a string
    #this information will be used by the method in Recipe that called this method, to add attributes to existing objects

  end

end
