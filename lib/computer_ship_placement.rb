
require './lib/grid'

class ComputerShipPlacement

  attr_reader :computer_grid, :two_unit_ship_first_coord, :two_unit_ship_second_coord,
              :three_unit_ship_first_coord, :three_unit_ship_second_coord, :three_unit_ship_third_coord
              :validation

  attr_writer :two_unit_ship_first_coord, :three_unit_ship_first_coord

  def initialize
    @computer_grid = Grid.new
    @two_unit_ship_first_coord = two_unit_ship_first_coord
    @two_unit_ship_second_coord = two_unit_ship_second_coord
    @three_unit_ship_first_coord = three_unit_ship_first_coord
    @three_unit_ship_middle_coord = three_unit_ship_middle_coord
    @three_unit_ship_end_coord = three_unit_ship_end_coord
    @validation = false
  end



  def two_unit_ship
    two_unit_ship_first_coord
    two_unit_ship_second_coord
  end

  def three_unit_ship
    three_unit_ship_first_coord
    three_unit_ship_middle_coord
    three_unit_ship_end_coord
    verify_ships_do_not_intersect
  end

  def two_unit_ship_first_coord ## memoization
    @two_unit_ship_first_coord ||= computer_grid.coordinates[rand(4)][rand(4)]
  end

  def two_unit_ship_second_coord ##refactor later to own separate rb file
    if two_unit_ship_first_coord == "A1"
      @two_unit_ship_second_coord = ["A2", "B1"].sample
    elsif two_unit_ship_first_coord == "A2"
      @two_unit_ship_second_coord = ["A1", "A3", "B2"].sample
    elsif two_unit_ship_first_coord == "A3"
      @two_unit_ship_second_coord = ["B3", "A2", "A4"].sample
    elsif two_unit_ship_first_coord == "A4"
      @two_unit_ship_second_coord = ["A3", "B4"].sample
    elsif two_unit_ship_first_coord == "B1"
      @two_unit_ship_second_coord = ["A1", "B2", "C2"].sample
    elsif two_unit_ship_first_coord == "B2"
      @two_unit_ship_second_coord = ["B1", "B3", "A2", "C2"].sample
    elsif two_unit_ship_first_coord == "B3"
      @two_unit_ship_second_coord = ["B2", "B4", "A3", "C3"].sample
    elsif two_unit_ship_first_coord == "B4"
      @two_unit_ship_second_coord = ["A4", "B3", "C3"].sample
    elsif two_unit_ship_first_coord == "C1"
      @two_unit_ship_second_coord = ["B1", "D1", "C2"].sample
    elsif two_unit_ship_first_coord == "C2"
      @two_unit_ship_second_coord = ["C1", "C3", "B2", "D2"].sample
    elsif two_unit_ship_first_coord == "C3"
      @two_unit_ship_second_coord = ["C2", "C4", "B3", "D3"].sample
    elsif two_unit_ship_first_coord == "C4"
      @two_unit_ship_second_coord = ["C3", "B4", "D4"].sample
    elsif two_unit_ship_first_coord == "D1"
      @two_unit_ship_second_coord = ["C1", "D2"].sample
    elsif two_unit_ship_first_coord == "D2"
      @two_unit_ship_second_coord = ["D1", "D3", "C2"].sample
    elsif two_unit_ship_first_coord == "D3"
      @two_unit_ship_second_coord = ["D2", "D4", "C3"].sample
    elsif two_unit_ship_first_coord == "D4"
      @two_unit_ship_second_coord = ["D3", "C4"].sample
    end
  end

  def three_unit_ship_first_coord##refactor later to own separate rb
    @three_unit_ship_first_coord ||= computer_grid.coordinates[rand(4)][rand(4)]
  end

  def three_unit_ship_end_coord##refacctor later to own separate rb
    if three_unit_ship_first_coord == "A1"
      @three_unit__ship_end_coord = ["A3", "C1"].sample
    elsif three_unit_ship_first_coord == "A2"
      @three_unit_ship_end_coord = ["A4", "C2"].sample
    elsif three_unit_ship_first_coord == "A3"
      @three_unit_ship_end_coord = ["A1", "C3"].sample
    elsif three_unit_ship_first_coord == "A4"
      @three_unit_ship_end_coord = ["A2", "C4"].sample
    elsif three_unit_ship_first_coord == "B1"
      @three_unit_ship_end_coord = ["D1", "B3"].sample
    elsif three_unit_ship_first_coord == "B2"
      @three_unit_ship_end_coord = ["D2", "B4"].sample
    elsif three_unit_ship_first_coord == "B3"
      @three_unit_ship_end_coord = ["B1", "D3"].sample
    elsif three_unit_ship_first_coord == "B4"
      @three_unit_ship_end_coord = ["B2", "D4"].sample
    elsif three_unit_ship_first_coord == "C1"
      @three_unit_ship_end_coord = ["A1", "C3"].sample
    elsif three_unit_ship_first_coord == "C2"
      @three_unit_ship_end_coord = ["A2", "C4"].sample
    elsif three_unit_ship_first_coord == "C3"
      @three_unit_ship_end_coord = ["C1", "A3"].sample
    elsif three_unit_ship_first_coord == "C4"
      @three_unit_ship_end_coord = ["A4", "C2"].sample
    elsif three_unit_ship_first_coord == "D1"
      @three_unit_ship_end_coord = ["B1", "D3"].sample
    elsif three_unit_ship_first_coord == "D2"
      @three_unit_ship_end_coord = ["D4", "B2"].sample
    elsif three_unit_ship_first_coord == "D3"
      @three_unit_ship_end_coord = ["D1", "B3"].sample
    elsif three_unit_ship_first_coord == "D4"
      @three_unit_ship_end_coord = ["B4", "D2"].sample
    end
  end

  def three_unit_ship_middle_coord
    if three_unit_ship_first_coord == "A1" && three_unit_ship_second_coord == "A3"
      @three_unit_ship_mid_coord = "A2"
    elsif three_unit_ship_first_coord == "A1" && three_unit_ship_second_coord == "C1"
      @three_unit_ship_mid_coord = "B1"
    elsif three_unit_ship_first_coord == "A2" && three_unit_ship_second_coord == "A4"
      @three_unit_ship_mid_coord = "A3"
    elsif three_unit_ship_first_coord == "A2" && three_unit_ship_second_coord == "C2"
      @three_unit_ship_mid_coord = "B2"
    elsif three_unit_ship_first_coord == "A3" && three_unit_ship_second_coord == "A1"
      @three_unit_ship_mid_coord = "A2"
    elsif three_unit_ship_first_coord == "A3" && three_unit_ship_second_coord == "C3"
      @three_unit_ship_mid_coord = "B3"
    elsif three_unit_ship_first_coord == "A4" && three_unit_ship_second_coord == "A2"
      @three_unit_ship_mid_coord = "A3"
    elsif three_unit_ship_first_coord == "A4" && three_unit_ship_second_coord == "C4"
      @three_unit_ship_mid_coord = "B4"
    elsif three_unit_ship_first_coord == "B1" && three_unit_ship_second_coord == "B3"
      @three_unit_ship_mid_coord = "B2"
    elsif three_unit_ship_first_coord == "B1" && three_unit_ship_second_coord == "D1"
      @three_unit_ship_mid_coord = "C1"
    elsif three_unit_ship_first_coord == "B2" && three_unit_ship_second_coord == "B4"
      @three_unit_ship_mid_coord = "B3"
    elsif three_unit_ship_first_coord == "B2" && three_unit_ship_second_coord == "D2"
      @three_unit_ship_mid_coord = "C2"
    elsif three_unit_ship_first_coord == "B3" && three_unit_ship_second_coord == "B1"
      @three_unit_ship_mid_coord = "B2"
    elsif three_unit_ship_first_coord == "B3" && three_unit_ship_second_coord == "D3"
      @three_unit_ship_mid_coord = "C3"
    elsif three_unit_ship_first_coord == "B4" && three_unit_ship_second_coord == "B2"
      @three_unit_ship_mid_coord = "B3"
    elsif three_unit_ship_first_coord == "B4" && three_unit_ship_second_coord == "D4"
      @three_unit_ship_mid_coord = "C4"
    elsif three_unit_ship_first_coord == "C1" && three_unit_ship_second_coord == "C3"
      @three_unit_ship_mid_coord = "C2"
    elsif three_unit_ship_first_coord == "C1" && three_unit_ship_second_coord == "A1"
      @three_unit_ship_mid_coord = "B1"
    elsif three_unit_ship_first_coord == "C2" && three_unit_ship_second_coord == "C4"
      @three_unit_ship_mid_coord = "C3"
    elsif three_unit_ship_first_coord == "C2" && three_unit_ship_second_coord == "A2"
      @three_unit_ship_mid_coord = "B2"
    elsif three_unit_ship_first_coord == "C3" && three_unit_ship_second_coord == "C1"
      @three_unit_mid_coord = "C2"
    elsif three_unit_ship_first_coord == "C3" && three_unit_ship_second_coord == "A3"
      @three_unit_ship_mid_coord = "B3"
    elsif three_unit_ship_first_coord == "C4" && three_unit_ship_second_coord == "C2"
      @three_unit_ship_mid_coord = "C3"
    elsif three_unit_ship_first_coord == "C4" && three_unit_ship_second_coord == "A4"
      @three_unit_ship_mid_coord = "B4"
    elsif three_unit_ship_first_coord == "D1" && three_unit_ship_second_coord == "D3"
      @three_unit_ship_mid_coord = "D2"
    elsif three_unit_ship_first_coord == "D1" && three_unit_ship_second_coord == "B1"
      @three_unit_ship_mid_coord = "C1"
    elsif three_unit_ship_first_coord == "D2" && three_unit_ship_second_coord == "D4"
      @three_unit_ship_mid_coord = "D3"
    elsif three_unit_ship_first_coord == "D2" && three_unit_ship_second_coord == "B2"
      @three_unit_ship_mid_coord = "C2"
    elsif three_unit_ship_first_coord == "D3" && three_unit_ship_second_coord == "D1"
      @three_unit_ship_mid_coord = "D2"
    elsif three_unit_ship_first_coord == "D3" && three_unit_ship_second_coord == "B3"
      @three_unit_ship_mid_coord = "C3"
    elsif three_unit_ship_first_coord == "D4" && three_unit_ship_second_coord == "D2"
      @three_unit_ship_mid_coord = "D3"
    elsif three_unit_ship_first_coord == "D4" && three_unit_ship_second_coord == "B4"
      @three_unit_ship_mid_coord = "C4"
    end
  end

  def verify_ships_do_not_intersect
    if three_unit_ship_first_coord == two_unit_ship_first_coord
      validation
    elsif three_unit_ship_first_coord == two_unit_ship_second_coord
      validation
    elsif three_unit_ship_second_coord == two_unit_ship_first_coord
      validation
    elsif three_unit_ship_second_coord == two_unit_ship_second_coord
      validation
    elsif three_unit_ship_third_coord == two_unit_ship_first_coord
      validation
    elsif three_unit_ship_third_coord == two_unit_ship_second_coord
      validation
    else
      @validation = true
    end
  end

  def operational
    if @validation == true
      two_unit_ship
      three_unit_ship
    end
  end


end
