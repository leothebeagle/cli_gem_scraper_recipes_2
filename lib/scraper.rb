
class Scraper #here is where you will pull the data and put it into a hash format. the hash will then be used by Recipe to instantiate new recipe objects

  def scrape_ba_recipes
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

end
