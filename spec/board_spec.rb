require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
    before(:each) do
        @board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
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
    
    describe '#valid placement?' do
        it 'returns true if coordinate is valid' do
            expect(@board.valid_coordinate?("A1")).to be true
        end

        it 'returns false if coordinate is invalid' do
            expect(@board.valid_coordinate?("Z9")).to be false
        end

        it 'returns false if wrong ship size' do
            expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be false
            expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be false
        end

        it 'returns true if correct ship size' do
            expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to be true
        end

        it 'returns false if coordinates are not consecutive' do
            expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be false
        end

        it 'returns true if coordinates are consecutive' do
            expect(@board.valid_placement?(@cruiser, ["A1", "B1", "C1"])).to be true
        end

        it 'returns false if coordinates decrease in value' do
            expect(@board.valid_placement?(@cruiser, ["C1", "B1", "A1"])).to be false
        end

        it 'returns true if all conditions are met' do
            expect(@board.valid_placement?(@submarine, ["A1", "A2"])). to be true
            expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])). to be true
        end
    end

    describe '#place ship' do
        it 'can place ship object in multiple cells' do
            @board.place(@cruiser, ["A1", "A2", "A3"])
        end

            
    end
end