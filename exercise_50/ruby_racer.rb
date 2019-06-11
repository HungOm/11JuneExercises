require "byebug"

# byebug
class Die
  attr_accessor :sides
  def initialize(sides = 6)
    @sides = sides
  end

  # Remember: rolls have to be between 1 and the sides - the minimum you can move is one step!
  # See: http://www.ruby-doc.org/core-2.6.3/Kernel.html#method-i-rand
  def roll
    rand(sides)+1
  end
  
end

class RubyRacer

  attr_accessor :length, :players
  # Should hold data about the race:
  # the players, their positions, the track length, etc.
  # @@score={}
  def initialize(players, length = 30)
    @players = Hash.new { |hash, key| hash[key] = [] }
    @length = length
    # @@score[players]=0
  end


  # Returns true if a player has reached the finish line and false otherwise.

  # byebug
  def finished?
    @players.values.each do|num|
      if num.sum >=@length
        return true
      end
    end
    false

  end

  # Rolls the die and advances each player accordingly
  # byebug
  def advance_player!(player)
    die = Die.new.roll
    @players[player]<<die
  
  end
  # byebug
  # Returns the winner if there is one, nil otherwise
  # byebug
  def winner
    if finished?
      @players.each do|key,score|
        if score.sum >=@length
          return key
        end
      end
    else
      nil
    end
  end


  # end
  # byebug
  # Prints the current game board
  # The board should have the same dimensions each time
  def print_gameboard
    
    @players.each do|key,scores|
      total = scores.sum
      if total > length-1
        total = length-1
      end
      # if key == :a 
      #   @length.times do |num|
      #     if num == total
      #       print "a|"
      #     else
      #       print " |"
      #     end
      #   end

      # else
      #   @length.times do |num|
      #     if num == total
      #       print "b|"
      #     else
      #       print " |"
      #     end
      #   end
      # end
      @length.times do |num|
        if num == total
          print key[0].to_s + "|"
        else
          print " |"
        end
        # print "-" *15
      end
      puts
      
    end
    puts
    puts 
    puts "-" *20
    puts "Current Leader board"
    puts "-" *20
  


    top_players={}
    @players.each do|key,value|
      top_players[key]=value.sum
      top_players.sort_by {|k,v| v}
      # ptop_players.to_a
    end
    # top = top_players.key(top_players.values.max)
    # puts "#{1}: #{top}"
    # for i in top_players.size
    top_players.to_a.each_with_index do|word,index|
      p "#{index+1}: #{top_players.to_a[index[0]]}"
    end


      


        
    return nil    

            
  end

  # For Part 2:
  # Prints the ranking board (Scoreboard)
  # def print_scoreboard
  # end

end


 #### HELPER CODE - DO NOT EDIT THIS SECTION ####
 
# The following methods will help us
# to update the screen when printing the board.
# We don't need to test these methods.
def reset_screen
  clear_screen
  move_to_home
end

# Clears the content on the terminal.
def clear_screen
  print "\e[2J"
end

# Moves the insert point in the terminal to the upper left.
def move_to_home
  print "\e[H"
end

 #### END HELPER CODE ####

 #### DRIVER CODE - DO NOT EDIT BELOW FOR PART 1 ####
 print " enter your name "
 user = gets.chomp
 players=[]
 players<<user
 while user.downcase != "y"
  
  print "add another player: "
  print "Or type 'y' start the game: "
  user = gets.chomp
  players<<user
  
 end

  

players<<user

game = RubyRacer.new(players)

# Clear the screen and print the board with players in their starting positions.
# Then pause, so users can see the starting board. The fun can begin!
reset_screen
puts game.print_gameboard
sleep(1)
# puts " #{game.finished?},,,,"

# Run the race.
# players.each do |player|
#   puts player
#   # Move a player forward.
#   p game.advance_player!(player)
# end
until game.finished?
  # Do this each round until the race is finished.

  players.each do |player|
    puts player
    # Move a player forward.
    p game.advance_player!(player)

    # Now that the player has moved,
    # reprint the board with the new player positions
    # and pause so users can see the updated board.
    reset_screen
    puts game.print_gameboard

    # We need to sleep a little, otherwise the game will blow right past us.
    # See http://www.ruby-doc.org/core-2.6.3/Kernel.html#method-i-sleep
    sleep(0.2)
  end 
end

# Once the race is finished, report the winner.
puts "Player '#{game.winner}' wins!"

 #### END OF DRIVER CODE ####

#  players= {"a"=>[1,2,3.]}
# p game.finished?