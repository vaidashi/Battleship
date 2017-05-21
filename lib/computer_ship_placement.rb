
require_relative 'grid'

class ComputerShipPlacement

  attr_reader :@computer_grid, :@two_unit_ship_first_coord, :@two_unit_ship_second_coord,
              :@three_unit_ship_first_coord, :@three_unit_ship_second_coord, :@three_unit_ship_third_coord
              :@validation 

  def initialize
    @computer_grid = Grid.new
    @two_unit_ship_first_coord = two_unit_ship_first_coord
    @two_unit_ship_second_coord = two_unit_ship_second_coord
    @three_unit_ship_first_coord = three_unit_ship_first_coord
    @three_unit_ship_second_coord = three_unit_ship_second_coord
    @three_unit_ship_third_coord = three_unit_ship_third_coord
    @validation = false
  end


end
