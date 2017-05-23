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



end
