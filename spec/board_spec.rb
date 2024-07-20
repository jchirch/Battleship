require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
    before(:each) do
        @board = Board.new
    end
    describe "#initialize" do
        it 'exists' do
            expect(@board.cells).to be_an_instance_of Hash
        end

        it 'is a populated hash' do
            expect(@board.cells).not_to be_empty
        end
    end
    
    describe '#validating' do
        it 'reports if coordinate is valid' do
            expect(@board.valid_coordinate?("A1")).to be true
        end



    end


end