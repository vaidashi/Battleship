require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_ship_placement'


class PlayerShipPlacementTest < Minitest::Test

  def test_if_class_exists
    player_ship = PlayerShipPlacement.new

    assert_instance_of PlayerShipPlacement, player_ship
  end

  # def test_if_coordinates_for_a_two_unit_ship_makes_sense
  #   placement = PlayerShipPlacement.new
  #   placement.two_unit_ship_first_coord = "A1"
  #   two_ship_second = placement.two_unit_ship_second_coord
  #
  #
  #   assert_includes ["A2", "B1"], two_ship_second
  # end

end
