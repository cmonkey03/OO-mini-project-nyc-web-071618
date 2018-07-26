class Allergen
  attr_reader :user, :ingredient

  @@all = []

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def self.all_ingredients
    self.all.map { |allergen| allergen.ingredient }
  end

  def self.all_ingredients_uniq
    all_ingredients.uniq
  end

  def self.is_allergen?(ingredient)
    self.all_ingredients_uniq.include?(ingredient)
  end

  def self.most_common_allergen
    freq = all_ingredients.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    all_ingredients.max_by { |v| freq[v] }
  end

end
