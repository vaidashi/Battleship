require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/grid'
require 'pry'

class GridTest < Minitest::Test

  def test_the_grid_exists
    game_grid = Grid.new

    assert_instance_of Grid, game_grid 
  end


end
