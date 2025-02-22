# Exercise 49: Orange Tree Simulator

# Implement the OrangeTree and Orange classes
# Use attr_reader, attr_writer, and/or attr_accessor so that we can call tree.height and tree.age to get a tree's height or age, respectively. Which of the three attr_ methods should you be using and why?
# Do the same with the Orange class so that we can call orange.diameter to get an orange's diamater.

# Implement Aging
# As a tree ages, it grows taller. Eventually it starts bearing fruit and stops growing — not necessarily at the same time. Some years later, the tree dies and can bear fruit no more!
# Implement an OrangeTree#age! instance method that will age your tree one year. Each year the tree should get some amount taller, and then eventually stop growing. You can decide when the tree stops growing.

# Later, it should die. At this point your OrangeTree class should:
# Have an OrangeTree#height method which returns the tree's current height
# Have an OrangeTree#age method which returns the tree's current age
# Have an OrangeTree#age! method which ages the tree one year and grows the tree a little, if it's able to grow
# Have an OrangeTree#dead? method which returns true if the tree has died

# Implement Orange-picking
# After some number of years — you decide — the orange tree starts to bear fruit. Write a method OrangeTree#any_oranges? which returns true if there are any oranges on the tree and false otherwise.
# Also write a method OrangeTree#pick_an_orange! which will return one of the oranges on the tree (an instance of the Orange class). If you try to pick an orange when there are no oranges left, your code should raise a NoOrangesError (defined in the source code).
# You'll also have to implement the Orange class at this point, including Orange.new and Orange#diameter.

# Bonus: Realistic Orange Tree Stats
# - Orange trees live up to around 40 years - http://homeguides.sfgate.com/long-orange-trees-produce-fruit-60137.html
# - Orange trees start at 8-12 inches (20cm) - https://www.fourwindsgrowers.com/our-citrus-trees/citrus-variety-info-chart.html
# - Orange tree heights increases for first 10 years+ - http://homeguides.sfgate.com/long-reach-full-size-dwarf-navel-orange-tree-43660.html
# - Orange trees bear 700-1250 fruits each time - http://faitc.org/wp-content/uploads/2013/08/Producing-Citrus-in-Florida2.pdf
# - Orange tree height increases around 80-120cm on average a year - http://homeguides.sfgate.com/long-reach-full-size-dwarf-navel-orange-tree-43660.html
# - Orange tree bears fruits from 2nd/3rd year onwards - http://homeguides.sfgate.com/long-reach-full-size-dwarf-navel-orange-tree-43660.html
# - Realistic orange trees also can die randomly (from diseases, or other causes)
# - Realistic orange trees has a higher chance of dying as it gets older


# END OF EXERCISE QUESTION
require "byebug"

# This is how you define your own custom exception classes
class NoOrangesError < StandardError
end

class OrangeTree
  
  # attr_writer :
  attr_accessor :age, :height, :fruits 
  # attr_reader :fruits, :height

  # Constructor for the tree
  def initialize
    # constructor code goes here
    @age = 0
    @height = 0
    @fruits = []
   
  end

  # Ages the tree one year
  def age!
    #tree aging code goes here
    if @age <40
      @age += 1
      @height = @height + 20
      rand(700..1250).times do |orange|
        orange = Orange.new
        fruits<<orange
      end
      
    else
      @age += 1
    end
     
    
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?
    # code to check if tree has any oranges goes here
    if @fruits.empty?
        false
    else
        true
    end

    
  end

  def dead?
    # check if tree is dead code goes here
    if @age>40
      return true
    else
      return false
    end

  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange!
    if any_oranges?
      @fruits.pop
    else
        raise NoOrangesError
    end
  end

  # def height
  #   if @age>=3 && @age<11
  #     @height += 20
  #   end
  # end


end


class Orange
  attr_accessor :diameter
  # Initializes a new Orange with diameter +diameter+
  def initialize
    @diameter= rand(5..14)
  end

end

tree = OrangeTree.new

tree.age! until tree.any_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} cm tall"
# byebug
until tree.dead?
  basket = []

  #It places the oranges in the basket
  #IT PLACES THE ORANGES IN THE basket
  # byebug
  while tree.any_oranges?
    basket << tree.pick_an_orange!
  end
  
  array =[]
  basket.each do |orange|
    array<<orange.diameter
  end
  total = array.inject{|acc,el| acc+el}
  avg_diameter = total/basket.size  # It's up to you to calculate the average diameter for this harvest.

  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height/100.0} m"
  puts "Harvest: #{basket.size} oranges with an average diameter of #{avg_diameter} cm"
  puts ""

  #Age the tree another year
  tree.age!
end


puts "Alas, the tree, she is dead!"
