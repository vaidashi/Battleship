
require 'pry'


class Messages

  def welcome_message
    puts "Welcome to BATTLESHIP"
  end

  def game_options
    puts "Would you like to (p)lay, read the (i)instructions, or (q)uit?"
  end

  def game_instructions
    puts "Battlship is a game where you and your opponent take turns attacking each other's ships\n"\
    "by correctly guessing their placement on the grid.\n"\
    "The first person to correctly guess and destroy all their opponent's ships wins."\

    puts "I will be your opponent. I will place my ships and you will be prompted to place your ships."
    puts "Ships cannot wrap around the board."
    puts "Ships cannot overlap."
    puts "Ships can be laid either horizontally or vertically."
    puts "Coordinates must correspond to the first and last units of the ship. (IE: You can't place a two unit ship at 'A1 A3')"
  end

  def player_ship_placement_prompt
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."

    puts "Enter the squares for the two-unit ship:"

  end


end
