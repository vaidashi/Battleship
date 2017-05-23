
require 'pry'


class Messages

  def welcome_message
    puts "Welcome to BATTLESHIP"
  end

  def game_options_message
    puts "Would you like to (p)lay, read the (i)instructions, or (q)uit?"
  end

  def incorrect_selection_message
    puts "Sorry, I don't understand your selection. Please try again."
  end

  def game_instructions_message
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

  end

  def player_two_element_ship_placement_message
    puts "Enter the coordinates for the two-unit ship:"
    puts "For example: A1 A2"

  end

  def player_three_element_ship_placement_message
    puts "Enter the coordinates for the three-unit ship:"
    puts "For example: A1 A3"
  end

  def enter_coordinates_to_attack_message
    puts "Which position would you like to fire upon?"
    puts "Make your decision by entering a coordinate you haven't chosen already and then press enter."
  end

  def player_board_message
    puts "Player Board"
  end

  def computer_board_message
    puts "Computer Board"
  end

  def computer_to_player_hit_message
    puts "Hit enemy ship!"
  end

  def computer_to_player_sunk_two_element_ship_message
    puts "You sunk my two-unit ship!"
  end

  def computer_to_player_sunk_three_element_ship_message
    puts "You sunk my three-unit ship!"
  end

  def player_gets_hit_message
    puts "Hit your ship!"
  end

  def player_loses_two_element_ship_message
    puts "Two-unit ship destroyed"
  end

  def player_loses_three_element_ship_message
    puts "Three-element ship destroyed"
  end

  def missed_message
    puts "Missed"
  end

  def player_wins_message
    puts "You sunk my final battleship!"
    puts "Congratulations, you win!"
  end

  def player_loses_message
    puts "I destroyed you final ship!"
    puts "Sorry, you lose. Game over."
  end

  def invalid_ship_coordinate_message
    puts "Sorry, those coordinates are out of range. Try again."
  end

  def invalid_ship_coordinate_message
    puts "Sorry, those coordinates don't meet the position or size requirements. Try again."
  end

  def overlapping_coordinate_message
    puts "Sorry, those coordinates overlap your other ship. Try again."
  end

  def already_fired_upon_message
    puts "You have fired a shot here already. Try a different coordinate."
  end

  def quit_message
    puts "You have quit the game."
  end

end
