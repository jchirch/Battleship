require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
    before(:each) do
        @game = Game.new
        @player_board = Board.new
        @computer_board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
        @rubber_duckie = Ship.new("Duckie", 1)
    end

    it 'exists' do
        expect(@game).to be_an_instance_of Game
    end

    describe '#start' do
        xit 'puts welcome message' do
            expect(@game.welcome).to be_an_instance_of String
        end

    end

    it 'places computer ships' do
        # @game.computer_placement
        @computer_board.place(@cruiser, ["A1", "A2", "A3"])
        # require 'pry'; binding.pry

        expect(@computer_board.cells[:ship]).to include(Ship)
    end

end
