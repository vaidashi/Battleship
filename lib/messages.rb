
require 'pry'


module Messages

  def welcome_message
    p "Welcome to BATTLESHIP"
  end

  def game_options_message
    p "Would you like to (p)lay, read the (i)instructions, or (q)uit?"
  end

  def incorrect_selection_message
    p "Sorry, I don't understand your selection. Please try again."
  end

  def game_instructions_message
    p "Battlship is a game where you and your opponent take turns attacking each other's ships\n"\
    "by correctly guessing their placement on the grid.\n"\
    "The first person to correctly guess and destroy all their opponent's ships wins."\

    p "I will be your opponent. I will place my ships and you will be prompted to place your ships."
    p "Ships cannot wrap around the board."
    p "Ships cannot overlap."
    p "Ships can be laid either horizontally or vertically."
    p "Coordinates must correspond to the first and last units of the ship. (IE: You can't place a two unit ship at 'A1 A3')"
  end

  def player_ship_placement_prompt
    p "I have laid out my ships on the grid."
    p "You now need to layout your two ships."
    p "The first is two units long and the second is three units long."
    p "The grid has A1 at the top left and D4 at the bottom right."

  end

  def player_two_element_ship_placement_message
    p "Enter the coordinates for the two-unit ship:"
    p "For example: A1 A2"

  end

  def player_three_element_ship_placement_message
    p "Enter the coordinates for the three-unit ship:"
    p "For example: A1 A3"
  end

  def enter_coordinates_to_attack_message
    p "Which position would you like to fire upon?"
    p "Make your decision by entering a coordinate you haven't chosen already and then press enter."
  end

  def player_board_message
    p "Player Board"
  end

  def computer_board_message
    p "Computer Board"
  end

  def next_turn_message
    p "Hit enter to continue"
  end

  def computer_to_player_hit_message
    p "Hit enemy ship!"
  end

  def computer_to_player_sunk_two_element_ship_message
    p "You sunk my two-unit ship!"
  end

  def computer_to_player_sunk_three_element_ship_message
    p "You sunk my three-unit ship!"
  end

  def player_gets_hit_message
    p "Hit your ship!"
  end

  def player_loses_two_element_ship_message
    p "Two-unit ship destroyed"
  end

  def player_loses_three_element_ship_message
    p "Three-element ship destroyed"
  end

  def missed_message
    p "Missed"
  end

  def player_wins_message
    p "You sunk my final battleship!"
    p "Congratulations, you win!"
  end

  def player_loses_message
    p "I destroyed you final ship!"
    p "Sorry, you lose. Game over."
  end

  def out_of_range_ship_coordinate_message
    p "Sorry, those coordinates are out of range. Try again."
  end

  def invalid_ship_coordinate_message
    p "Sorry, those coordinates don't meet the position or size requirements. Try again."
  end

  def overlapping_coordinate_message
    p "Sorry, those coordinates overlap your other ship. Try again."
  end

  def already_fired_upon_message
    p "You have fired a shot here already. Try a different coordinate."
  end

  def quit_message
    p "You have quit the game."
  end

end
