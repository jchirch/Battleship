require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    before(:each) do 
        @cell = Cell.new("B4")
        @cruiser = Ship.new("Cruiser", 3)
        @cell.place_ship(@cruiser)
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
            expect(@cell.ship).to eq @cruiser
            expect(@cell.empty?).to be false
        end

        it 'is not fired upon by default' do
            expect(@cell.fired_upon?).to be false
        end
    end


end