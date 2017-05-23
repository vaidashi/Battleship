require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_ship_placement'


class PlayerShipPlacementTest < Minitest::Test

  def test_if_class_exists
    player_ship = PlayerShipPlacement.new

    assert_instance_of PlayerShipPlacement, player_ship
  end

end
