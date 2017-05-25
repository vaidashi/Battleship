require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_ship_placement'


class PlayerShipPlacementTest < Minitest::Test

  def test_if_class_exists
    player_ship = PlayerShipPlacement.new

    assert_instance_of PlayerShipPlacement, player_ship
  end

  def test_if_coordinates_for_a_two_unit_ship_makes_sense
    placement = PlayerShipPlacement.new

    assert_equal ["A1", "A2"], placement.get_two_unit_ship_placement("A1 A2")
  end

  def test_if_coordinates_for_a_three_unit_ship_makes_sense
    placement = PlayerShipPlacement.new

    assert_equal ["A1", "A3"], placement.get_three_unit_ship_placement("A1 A3")
  end
end
