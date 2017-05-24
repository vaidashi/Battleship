require './lib/grid'
require './lib/computer_ship_placement'
require './lib/messages'
require 'pry'


class PlayerBoard

  include Messages

  attr_reader :computer_ship_placement, :two_unit_ship_first_coord, :two_unit_ship_second_coord,
              :three_unit_ship_first_coord, :three_unit_ship_mid_coord, :three_unit_ship_end_coord,
              :start_time, :end_time

  attr_accessor :player_board, :two_unit_ship_health, :three_unit_ship_health,
                :shots_taken, :coordinates_targeted


  def initialize
    @player_board = Grid.new
    @computer_ship_placement = ComputerShipPlacement.new
    # computer_ship_placement.run
    @two_unit_ship_first_coord = computer_ship_placement.two_unit_ship_first_coord
    @two_unit_ship_second_coord = computer_ship_placement.two_unit_ship_second_coord
    @three_unit_ship_first_coord = computer_ship_placement.three_unit_ship_first_coord
    @three_unit_ship_mid_coord = computer_ship_placement.three_unit_ship_mid_coord
    @three_unit_ship_end_coord = computer_ship_placement.three_unit_ship_end_coord
    @coordinates_targeted = []
    @two_unit_ship_health = 2
    @three_unit_ship_health = 3
    @shots_taken = 0
    @start_time = Time.now
    @end_time  = end_time
  end


  def display_player_board
    player_board_message
    player_board.display_grid
  end

  def fire_shot
    enter_coordinates_to_attack_message
  end

  def acquire_target
    fire_shot
    target = gets.chomp.upcase
    verify_coord(target)
    @shots_taken += 1
  end

  def verify_coord(target)
    verified_coord = false
    verified_coord = player_board.coordinate_values_duplicate_check.to_a.any? do |index|
      target == index
    end
    if verified_coord == false
      invalid_ship_coordinate_message
      return
    end

    checking_repeated_shots = coordinates_targeted.any? do |coord|
      target == coord
    end

    if checking_repeated_shots == false
      coordinates_targeted << target
    elsif checking_repeated_shots == true
      already_fired_upon_message
      return
    end

    hit_or_miss(target)
    return verified_coord
  end

  def hit_or_miss(target)
    if target == two_unit_ship_first_coord || target == two_unit_ship_second_coord || target == three_unit_ship_first_coord || target == three_unit_ship_mid_coord || target == three_unit_ship_end_coord
      hit(target)
    else
      miss(target)
    end
  end

  def hit(target)
    i = player_board.all_coordinate_values.index(target)
    player_board.all_coordinate_values[i] = "H "
    ship_health(target)
    game_over
  end

  def ship_health(target)
    if target == two_unit_ship_first_coord || target == two_unit_ship_second_coord
      @two_unit_ship_health -= 1
      if @two_unit_ship_health > 0
        computer_to_player_hit_message
      elsif @two_unit_ship_health == 0
        computer_to_player_sunk_two_element_ship_message
      end
    elsif target == three_unit_ship_first_coord || target == three_unit_ship_mid_coord || target == three_unit_ship_end_coord
      @three_unit_ship_health -= 1
      if @three_unit_ship_health > 0
        computer_to_player_hit_message
      elsif @three_unit_ship_health == 0
        computer_to_player_sunk_three_element_ship_message
      end
    end
  end

  def miss(target)
    missed_message
    i = player_board.all_coordinate_values.index(target)
    player_board.all_coordinate_values[i] = "M "
  end

  def game_over
    if @two_unit_ship_health == 0 && @three_unit_ship_health == 0
      player_wins_message
      puts "Shots Taken: #{shots_taken}"
      @end_time = Time.now
      puts "Total Game Time: #{@end_time - @start_time}"
      abort
    end
  end

end
