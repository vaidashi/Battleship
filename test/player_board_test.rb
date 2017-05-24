require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/player_board'
require 'pry'


class PlayerBoardTest < Minitest::Test

  def test_class_exists
    player_board = PlayerBoard.new

    assert_instance_of PlayerBoard, player_board
  end

  def test_player_has_grid
    player = PlayerBoard.new
    player_grid = player.player_board

    assert_instance_of Grid, player_grid
  end

  def test_verification_of_coordinates
    player = PlayerBoard.new
    other_player = PlayerBoard.new

    target = "A1"
    verify  = player.verify_coord(target)

    another_target = "A7"
    verify_again = other_player.verify_coord(another_target)

    assert verify
    refute verify_again
  end

  def test_if_attempted_shots_get_archived
    player = PlayerBoard.new
    target = "A1"
    verify  = player.verify_coord(target)

    assert player.coordinates_targeted.length > 0
  end

  # def test_if_it_notifies_of_a_repeat_firing_coordinate
  #   player = PlayerBoard.new
  #   player.coordinates_targeted = [ "A1", "A2"]
  #   target = "A1"
  #   verify = player.verify_coord(target)
  #
  #   assert_equal already_fired_upon_message, verify
  # end



end
