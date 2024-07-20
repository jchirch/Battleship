require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do

    it 'exists' do
        @board = Board.new
        require 'pry'; binding.pry
        expect(@board.cells).to be_an_instance_of Hash
    end


end