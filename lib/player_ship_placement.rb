require './lib/grid'
require './lib/messages'
require 'pry'

class PlayerShipPlacement

  include Messages


  attr_reader :player_grid, :two_unit_ship_first_coord, :two_unit_ship_second_coord,
              :three_unit_ship_first_coord, :three_unit_ship_mid_coord, :three_unit_ship_end_coord


  def initialize
    @player_grid = Grid.new
    @two_unit_ship_first_coord = two_unit_ship_first_coord
    @two_unit_ship_second_coord = two_unit_ship_second_coord
    @three_unit_ship_first_coord = three_unit_ship_first_coord
    @three_unit_ship_mid_coord = three_unit_ship_mid_coord
    @three_unit_ship_end_coord = three_unit_ship_end_coord
  end

  def start_ships
    player_ship_placement_prompt
    validate_two_unit_ship_placement
    validate_three_unit_ship_placement
  end

  def get_two_unit_ship_placement
    player_two_element_ship_placement_message
    two_unit_placement = gets.chomp.upcase
    two_unit_coord_combo = two_unit_placement.split(' ')
    @two_unit_ship_first_coord = two_unit_coord_combo[0]
    @two_unit_ship_second_coord = two_unit_coord_combo[1]
    verify_allowable_position
    return two_unit_coord_combo
  end

  def validate_two_unit_ship_placement##checking if coordinates are in grid space
    get_two_unit_ship_placement.to_a.each do |word|
      verify_within_grid = player_grid.all_coordinate_values.to_a.any? do |index|
        word == index
      end
      if verify_within_grid == false
        invalid_ship_coordinate_message
        validate_two_unit_ship_placement
      end
    end
  end

  def verify_allowable_position##checking if coordinates are next to each other
    if two_unit_ship_first_coord == "A1"#need to change from && to ||??
      if two_unit_ship_second_coord != "A2" || two_unit_ship_second_coord != "B1"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "A2"
      if two_unit_ship_second_coord != "A1" || two_unit_ship_second_coord != "A3" || two_unit_ship_second_coord != "B2"
        invalid_entry
      end
    elsif two_unit_ship_ship_first_coord == "A3"
      if two_unit_ship_second_coord != "A2" || two_unit_ship_second_coord != "A4" || two_unit_ship_second_coord != "B3"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "A4"
      if two_unit_ship_second_coord != "A3" || two_unit_ship_second_coord != "B4"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "B1"
      if two_unit_ship_second_coord != "A1" || two_unit_ship_second_coord != "C1" || two_unit_ship_second_coord != "B2"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "B2"
      if two_unit_ship_second_coord != "A2" || two_unit_ship_second_coord != "C2" || two_unit_ship_second_coord != "B1" || two_unit_ship_second_coord != "B3"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "B3"
      if two_unit_ship_second_coord != "A3" || two_unit_ship_second_coord != "C3" || two_unit_ship_second_coord != "B2" || two_unit_ship_second_coord != "B4"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "B4"
      if two_unit_ship_second_coord != "A4" || two_unit_ship_second_coord != "C4" || two_unit_ship_second_coord != "B3"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "C1"
      if two_unit_ship_second_coord != "C2" || two_unit_ship_second_coord != "B1" || two_unit_ship_second_coord != "D1"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "C2"
      if two_unit_ship_second_coord != "C1" || two_unit_ship_second_coord != "C3" || two_unit_ship_second_coord != "B2" || two_unit_ship_second_coord != "D2"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "C3"
      if two_unit_ship_second_coord != "C4" || two_unit_ship_second_coord != "C2" || two_unit_ship_second_coord != "B3" || two_unit_ship_second_coord != "D3"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "C4"
      if two_unit_ship_second_coord != "B4" || two_unit_ship_second_coord != "C3" || two_unit_ship_second_coord != "D4"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "D1"
      if two_unit_ship_second_coord != "D2" || two_unit_ship_second_coord != "C1"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "D2"
      if two_unit_ship_second_coord != "D1" || two_unit_ship_second_coord != "D3" || two_unit_ship_second_coord != "C2"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "D3"
      if two_unit_ship_second_coord != "C3" || two_unit_ship_second_coord != "D2" || two_unit_ship_second_coord != "D4"
        invalid_entry
      end
    elsif two_unit_ship_first_coord == "D4"
      if two_unit_ship_second_coord != "D3" || two_unit_ship_second_coord != "C4"
        invalid_entry
      end
    end
  end

  def invalid_entry
    invalid_ship_coordinate_message
    validate_two_unit_ship_placement
  end

  def get_three_unit_ship_placement
    player_three_element_ship_placement_message
    three_unit_placement = gets.chomp.upcase
    three_unit_coord_combo = three_unit_placement.split(' ')
    @three_unit_ship_first_coord = three_unit_coord_combo[0]
    @three_unit_ship_end_coord = three_unit_coord_combo[1]
    get_three_unit_middle_coordinate
    return three_unit_coord_combo
  end

  def get_three_unit_middle_coordinate
    if three_unit_ship_first_coord == "A1" && three_unit_ship_second_coord == "A3"
      @three_unit_ship_mid_coord = "A2"
    elsif three_unit_ship_first_coord == "A1" && three_unit_ship_second_coord == "C1"
      @three_unit_ship_mid_coord = "B1"
    elsif three_unit_ship_first_coord == "A2" && three_unit_ship_second_coord == "A4"
      @three_unit_ship_mid_coord = "A3"
    elsif three_unit_ship_first_coord == "A2" && three_unit_ship_second_coord == "C2"
      @three_unit_ship_mid_coord = "B2"
    elsif three_unit_ship_first_coord == "A3" && three_unit_ship_second_coord == "A1"
      @three_unit_ship_mid_coord = "A2"
    elsif three_unit_ship_first_coord == "A3" && three_unit_ship_second_coord == "C3"
      @three_unit_ship_mid_coord = "B3"
    elsif three_unit_ship_first_coord == "A4" && three_unit_ship_second_coord == "A2"
      @three_unit_ship_mid_coord = "A3"
    elsif three_unit_ship_first_coord == "A4" && three_unit_ship_second_coord == "C4"
      @three_unit_ship_mid_coord = "B4"
    elsif three_unit_ship_first_coord == "B1" && three_unit_ship_second_coord == "B3"
      @three_unit_ship_mid_coord = "B2"
    elsif three_unit_ship_first_coord == "B1" && three_unit_ship_second_coord == "D1"
      @three_unit_ship_mid_coord = "C1"
    elsif three_unit_ship_first_coord == "B2" && three_unit_ship_second_coord == "B4"
      @three_unit_ship_mid_coord = "B3"
    elsif three_unit_ship_first_coord == "B2" && three_unit_ship_second_coord == "D2"
      @three_unit_ship_mid_coord = "C2"
    elsif three_unit_ship_first_coord == "B3" && three_unit_ship_second_coord == "B1"
      @three_unit_ship_mid_coord = "B2"
    elsif three_unit_ship_first_coord == "B3" && three_unit_ship_second_coord == "D3"
      @three_unit_ship_mid_coord = "C3"
    elsif three_unit_ship_first_coord == "B4" && three_unit_ship_second_coord == "B2"
      @three_unit_ship_mid_coord = "B3"
    elsif three_unit_ship_first_coord == "B4" && three_unit_ship_second_coord == "D4"
      @three_unit_ship_mid_coord = "C4"
    elsif three_unit_ship_first_coord == "C1" && three_unit_ship_second_coord == "C3"
      @three_unit_ship_mid_coord = "C2"
    elsif three_unit_ship_first_coord == "C1" && three_unit_ship_second_coord == "A1"
      @three_unit_ship_mid_coord = "B1"
    elsif three_unit_ship_first_coord == "C2" && three_unit_ship_second_coord == "C4"
      @three_unit_ship_mid_coord = "C3"
    elsif three_unit_ship_first_coord == "C2" && three_unit_ship_second_coord == "A2"
      @three_unit_ship_mid_coord = "B2"
    elsif three_unit_ship_first_coord == "C3" && three_unit_ship_second_coord == "C1"
      @three_unit_ship_mid_coord = "C2"
    elsif three_unit_ship_first_coord == "C3" && three_unit_ship_second_coord == "A3"
      @three_unit_ship_mid_coord = "B3"
    elsif three_unit_ship_first_coord == "C4" && three_unit_ship_second_coord == "C2"
      @three_unit_ship_mid_coord = "C3"
    elsif three_unit_ship_first_coord == "C4" && three_unit_ship_second_coord == "A4"
      @three_unit_ship_mid_coord = "B4"
    elsif three_unit_ship_first_coord == "D1" && three_unit_ship_second_coord == "D3"
      @three_unit_ship_mid_coord = "D2"
    elsif three_unit_ship_first_coord == "D1" && three_unit_ship_second_coord == "B1"
      @three_unit_ship_mid_coord = "C1"
    elsif three_unit_ship_first_coord == "D2" && three_unit_ship_second_coord == "D4"
      @three_unit_ship_mid_coord = "D3"
    elsif three_unit_ship_first_coord == "D2" && three_unit_ship_second_coord == "B2"
      @three_unit_ship_mid_coord = "C2"
    elsif three_unit_ship_first_coord == "D3" && three_unit_ship_second_coord == "D1"
      @three_unit_ship_mid_coord = "D2"
    elsif three_unit_ship_first_coord == "D3" && three_unit_ship_second_coord == "B3"
      @three_unit_ship_mid_coord = "C3"
    elsif three_unit_ship_first_coord == "D4" && three_unit_ship_second_coord == "D2"
      @three_unit_ship_mid_coord = "D3"
    elsif three_unit_ship_first_coord == "D4" && three_unit_ship_second_coord == "B4"
      @three_unit_ship_mid_coord = "C4"
    else
      invalid_ship_coordinate_message
      validate_three_unit_ship_placement
    end
  end
  end

  def validate_three_unit_ship_placement ## checking if coordinates are within grid space
    get_three_unit_ship_placement.to_a.each do |word|
      verify_within_grid = player_grid.all_coordinate_values.to_a.any? do |index|
        word == index
      end
      if verify_within_grid == false
        out_of_range_ship_coordinate_message
        validate_three_unit_ship_placement
      end
    end
    make_sure_no_overlap
  end

  def make_sure_no_overlap
    if three_unit_ship_first_coord == two_unit_ship_first_coord || three_unit_ship_first_coord == two_unit_ship_second_coord
      overlapping_coordinate_message
      validate_three_unit_ship_placement
    elsif three_unit_ship_end_coord == two_unit_ship_first_coord || three_unit_ship_end_coord == two_unit_ship_second_coord
      overlapping_coordinate_message
      validate_three_unit_ship_placement
    elsif three_unit_ship_mid_coord == two_unit_ship_first_coord || three_unit_ship_mid_coord == two_unit_ship_second_coord
      overlapping_coordinate_message
      validate_three_unit_ship_placement
    end
  end
