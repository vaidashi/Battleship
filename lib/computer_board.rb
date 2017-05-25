require './lib/grid'
require './lib/player_ship_placement'
require './lib/messages'
require 'pry'


class ComputerBoard
  include Messages

  attr_reader :player_ship_placement, :two_unit_ship_first_coord, :two_unit_ship_second_coord,
              :three_unit_ship_first_coord, :three_unit_ship_mid_coord, :three_unit_ship_end_coord,
              :start_time, :end_time

  attr_accessor :computer_board, :coordinates_targeted, :two_unit_ship_health, :three_unit_ship_health,
                :shots_taken


  def initialize
    @computer_board = Grid.new
    @player_ship_placement = PlayerShipPlacement.new
    @two_unit_ship_first_coord = player_ship_placement.two_unit_ship_first_coord
    @two_unit_ship_second_coord = player_ship_placement.two_unit_ship_second_coord
    @three_unit_ship_first_coord = player_ship_placement.three_unit_ship_first_coord
    @three_unit_ship_mid_coord = player_ship_placement.three_unit_ship_mid_coord
    @three_unit_ship_end_coord = player_ship_placement.three_unit_ship_end_coord
    @coordinates_targeted = []
    @two_unit_ship_health = 2
    @three_unit_ship_health = 3
    @shots_taken = 0
    @start_time = Time.now
    @end_time = end_time
    @two_unit_ship_location = [@two_unit_ship_first_coord, @two_unit_ship_second_coord]
    @three_unit_ship_location = [@three_unit_ship_first_coord, @three_unit_ship_mid_coord, @three_unit_ship_end_coord]
    @add_computer_ship_location
  end


  def display_computer_board
    computer_board_message
    computer_board.display_grid
  end

  def add_computer_ship_location
    @two_unit_ship_location.each do |s|
      i = computer_board.all_coordinate_values.index(s)
      computer_board.all_coordinate_values[i] = "s "
    end
    @three_unit_ship_location.each do |s|
      i = computer_board.all_coordinate_values.index(s)
      computer_board.all_coordinate_values[i] = "S "
    end
  end

  def get_firing_coordinates
    target = "M "
    until target != "H " && target != "M "
      target = computer_board.all_coordinate_values[rand(16)]
    end
    @shots_taken += 1
    hit_or_miss(target)
    return target
  end

  def hit_or_miss(target)
    if target == "S " || target == "s "
      hit(target)
    else
      miss(target)
    end
  end

  def hit(target)
    i = computer_board.all_coordinate_values.index(target)
    computer_board.all_coordinate_values[i] = "H "
    if target == "s "
      @two_unit_ship_health -= 1
      if @two_unit_ship_health > 0
        player_gets_hit_message
      elsif @two_unit_ship_health == 0
        player_loses_two_element_ship_message
      end
    elsif target == "S "
      @three_unit_ship_health -= 1
      if @three_unit_ship_health > 0
        player_gets_hit_message
      elsif @three_unit_ship_health == 0
        player_loses_three_element_ship_message
      end
    end
    game_over
  end

  def game_over
    if @two_unit_ship_health == 0 && @three_unit_ship_health == 0
      player_loses_message
      p "Shots Taken: #{shots_taken}"
      @end_time = Time.now
      p "Total Game Time : #{@end_time - @start_time}"
      abort
    end
  end

  def miss(target)
    missed_message
    i  = computer_board.all_coordinate_values.index(target)
    computer_board.all_coordinate_values[i] = "M "
  end

# binding.pry

end
