require './lib/messages'
require './lib/computer_ship_placement'
require './lib/player_ship_placement'
require 'pry'

class Menu

include Messages

  def initialize
    start_screen
  end

  def start_screen
    welcome_message
    game_options_message
    menu_selection = gets.chomp.downcase
      if menu_selection == "p" || menu_selection == "play"
        play
      elsif menu_selection == "i" || menu_selection == "instructions"
        instructions
      elsif menu_selection == "q" || menu_selection == "quit"
        quit
      else
        incorrect_selection_message
        new_entry = gets.chomp.downcase
        new_entry
      end
  end

  def play
    computer_placement = ComputerShipPlacement.new
    player_placement = PlayerShipPlacement.new

  end

  def instructions
    game_instructions_message
    instructions_screen_entry = gets.chomp.downcase
    if instructions_screen_entry == "p" || instructions_screen_entry == "play"
      play
    elsif instructions_screen_entry == "q" || instructions_screen_entry == "quit"
      quit
    else
      incorrect_selection_message
      new_entry = gets.chomp.downcase
      new_entry
    end
  end

  def quit
    quit_message
    exit
  end

end

menu = Menu.new
# menu.start_screen
