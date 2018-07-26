
class Recipe

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def recipe_cards
    RecipeCard.all.select { |card| card.recipe == self }
  end

  def users
    recipe_cards.map { |cards| cards.user }
  end

  def recipe_ingredients
    RecipeIngredient.all.select { |ings| ings.recipe == self }
  end

  def ingredients
    recipe_ingredients.map { |ing| ing.ingredient  }
  end

  def allergens
    ingredients.select { |ing| Allergen.is_allergen?(ing) }
  end

  def add_ingredients(ingredient)
    RecipeIngredient.new(ingredient, self)
  end

  def self.all
    @@all
  end

  def self.most_popular
    RecipeCard.most_popular_recipe
  end

end
