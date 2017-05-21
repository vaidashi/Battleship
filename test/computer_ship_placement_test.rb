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

end
