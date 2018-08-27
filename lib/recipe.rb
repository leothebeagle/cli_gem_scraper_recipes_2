class Recipe #the only other class that Recipes will interact with is Scraper. Its the only other class its aware of.
  attr_accessor :name, :description, :url

  @@top_recipes = []

  def self.top_recipes
    @@top_recipes
  end

  def save
    self.class.top_recipes << self
  end

  def self.create_from_hash(recipe_hash) #you are given a recipe hash, which you will iterate over and instantiate new Recipe objects.
    recipe_hash.each do |recipe_name, recipe_attributes|
      recipe = Recipe.new
      recipe.name = recipe_name.to_s
      recipe.description = recipe_attributes[:description]
      recipe.url = recipe_attributes[:url]
      recipe.save
    end
  end

  def self.create_from_ba_scrape
    scraped_hash = Scraper.scrape_ba_recipes
    self.create_from_hash(scraped_hash)
  end
end




# recipes = {
#   :pasta => {:description => "lovely pasta", :url => "https://www.pasta.com"},
#   :rice => {:description => "fluffy, Persian rice", :url => "https://www.rice.com"},
#   :meatballs => {:description => "Dawud Basha", :url => "https://www.dawudbasha.com"}
# }
