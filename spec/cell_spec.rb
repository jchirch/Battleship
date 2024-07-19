require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    before(:each) do 
        @cruiser = Ship.new("Cruiser", 3)
        @cell = Cell.new("B4")
        @cell_1 = Cell.new("B4")
        @cell_2 = Cell.new("C3")
    end

    describe '#initialize' do
        it 'exists' do
            expect(@cell).to be_an_instance_of Cell
        end

        it 'has an attribute' do
            expect(@cell.coordinate).to eq "B4"
        end
    end

    describe '#cell status' do
        it 'is nil by default' do
            expect(@cell.ship).to eq nil
        end

        it 'is empty by default' do
            expect(@cell.empty?).to be true
        end

        it 'can place a ship' do
            @cell.place_ship(@cruiser)

            expect(@cell.ship).to eq @cruiser
            expect(@cell.empty?).to be false
        end

        it 'is not fired upon by default' do
            @cell.place_ship(@cruiser)

            expect(@cell.fired_upon?).to be false
        end

        it 'can fire upon a cell' do
            @cell.place_ship(@cruiser)
            @cell.fire_upon

            expect(@cell.fired_upon?).to be true
        end

        it 'cell containing ship fired up decreases health' do
            @cell.place_ship(@cruiser)
            @cell.fire_upon

            expect(@cell.ship.health).to eq 2
        end
    end

    describe '#render' do
        it 'defaults to "."' do
            expect(@cell_1.render).to eq "."
        end

        it 'changes render when fired upon' do
            expect(@cell_1.render).to eq "."

            @cell_1.fire_upon

            expect(@cell_1.render).to eq "M"
        end
      
        it 'renders S when my board is true' do
            @cell_2.place_ship(@cruiser)
            expect(@cell_2.render).to eq "."
            expect(@cell_2.render(true)).to eq "S"
        end
    end
end