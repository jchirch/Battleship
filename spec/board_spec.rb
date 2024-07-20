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

        it 'has expected ammount of key value pairs' do
            expect(@board.cells.length).to eq 16
        end

        it 'has keys with cell object values' do
            expect(@board.cells["A1"]).to be_an_instance_of Cell
        end
    end
    
    describe '#validating' do
        it 'reports if coordinate is valid' do
            expect(@board.valid_coordinate?("A1")).to be true
        end

        it 'reports if coordinate is invalid' do
            expect(@board.valid_coordinate?("Z9")).to be false
        end



    end


end