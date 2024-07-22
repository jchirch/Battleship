require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
    before(:each) do
        @player_board = Board.new
        @computer_board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
        @rubber_duckie = Ship.new("Duckie", 1)
    end

    



end
