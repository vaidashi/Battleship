require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/computer_ship_placement'
require 'pry'

class ComputerShipPlacementTest < Minitest::Test

  def test_computer_ship_placement_exists
      placement = ComputerShipPlacement.new

      assert_instance_of ComputerShipPlacement, placement
  end

  def test_first_coordinate_assignment
      placement = ComputerShipPlacement.new
      first_coord = placement.two_unit_ship_first_coord

      possible_coords = [["A1", "A2", "A3", "A4"],
                        ["B1", "B2", "B3", "B4"],
                        ["C1", "C2", "C3", "C4"],
                        ["D1", "D2", "D3", "D4"]]

      has_coord = possible_coords.any? do |index|
        first_coord
      end
      assert has_coord
  end

end
