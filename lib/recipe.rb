class Recipe #the only other class that Recipes will interact with is Scraper. Its the only other class its aware of.
  attr_accessor :name, :description, :url, :ingredients, :directions

  @@top_recipes = []

  def self.top_recipes
    @@top_recipes
  end

  def save
    self.class.top_recipes << self
  end
end
