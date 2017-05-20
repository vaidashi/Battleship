require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/menu'
require 'pry'


class MenuTest < Minitest::Test


  def test_if_menu_exists
  game_menu = Menu.new

  assert_instance_of Menu, game_menu
  end



end
