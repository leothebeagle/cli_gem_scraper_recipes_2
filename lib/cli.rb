class CliController


  def call

  end

  def list

    Recipe.top_recipes.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.name} - #{recipe.description} - #{recipe.url}"
    end
  end
end
