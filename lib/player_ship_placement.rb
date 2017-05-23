require './lib/grid'
require './lib/messages'


class PlayerShipPlacement

  include Messages

  attr_reader :player_grid, :two_unit_ship_first_coord, :two_unit_ship_second_coord,
              :three_unit_ship_first_coord, :three_unit_ship_second_coord, :three_unit_ship_end_coord
              :validation

  def initialize
    @player_grid = Grid.new
    @two_unit_ship_first_coord = two_unit_ship_first_coord
    @two_unit_ship_second_coord = two_unit_ship_second_coord
    @three_unit_ship_first_coord = three_unit_ship_first_coord
    @three_unit_ship_middle_coord = three_unit_ship_middle_coord
    @three_unit_ship_end_coord = three_unit_ship_end_coord
    @validation = false
  end

  def start_ships
    player_ship_placement_prompt
    validate_two_unit_ship_placement
    validate_three_unit_ship_placement
  end

  def get_two_unit_ship_placement
    player_two_element_ship_placement_message
    two_unit_placement = gets.chomp.upcase

  end

end
