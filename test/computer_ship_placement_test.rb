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

      has_coord = possible_coords.any? do |i|
        first_coord
      end
      assert has_coord
  end

  def test_if_coordinates_for_a_two_unit_ship_makes_sense
      placement = ComputerShipPlacement.new
      placement.two_unit_ship_first_coord = "A1"
      two_ship_second = placement.two_unit_ship_second_coord


      assert_includes ["A2", "B1"], two_ship_second
  end

  def test_if_coordinates_for_a_three_unit_ship_makes_sense
      placement = ComputerShipPlacement.new
      placement.three_unit_ship_first_coord = "A3"
      three_ship_end = placement.three_unit_ship_end_coord

      assert_includes ["A1", "C3"], three_ship_end
  end

  def test_if_coordinates_are_valid_within_grid_space
      placement = ComputerShipPlacement.new
      placement.three_unit_ship_first_coord = "A4"
      three_ship_end = placement.three_unit_ship_end_coord
      possible = ["M1", "E1"].sample

      refute_equal possible, three_ship_end
  end

  def test_if_ship_coordinates_do_not_intersect
      placement = ComputerShipPlacement.new
      two_ship = placement.two_unit_ship_first_coord
      three_ship = placement.three_unit_ship_first_coord

      refute_equal two_ship, three_ship
  end


end
