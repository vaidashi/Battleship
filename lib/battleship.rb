require './lib/messages'
require './lib/computer_board'
require './lib/computer_ship_placement'
require './lib/grid'
require './lib/menu'
require './lib/player_board'
require './lib/player_ship_placement'


class Battleship

  include Messages

  def initialize
    run_game
  end

  def run_game
    menu = Menu.new
    game_flow
  end

  def game_flow
    player = PlayerBoard.new
    computer = ComputerBoard.new
    until (computer.two_unit_ship_health == 0 && computer.three_unit_ship_health == 0) || (player.two_unit_ship_health == 0 && player.three_unit_ship_health == 0)
      player.display_player_board
      player.acquire_target
      player.display_player_board
      next_turn_message
      computer.get_firing_coordinates
      computer.display_computer_board
    end
  end


end

new_game = Battleship.new
