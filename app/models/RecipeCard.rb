
class RecipeCard
  attr_reader :user, :recipe, :date, :rating

  @@all = []

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

  def self.all_recipes
    self.all.map { |card| card.recipe }
  end

  def self.most_popular_recipe
    freq = all_recipes.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    all_recipes.max_by { |v| freq[v] }
  end


end
