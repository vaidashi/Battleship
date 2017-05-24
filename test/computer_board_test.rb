require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_board'


class ComputerBoardTest < Minitest::Test

  def test_class_exists
    comp_board = ComputerBoard.new

    assert_instance_of ComputerBoard, comp_board
  end

  def test_gets_firing_target
    comp_board = ComputerBoard.new
    target = comp_board.get_firing_coordinates
    actual_target = comp_board.computer_board.coordinate_values_duplicate_check.any? do |coord|
      target == coord
    end

    assert actual_target
  end

end
