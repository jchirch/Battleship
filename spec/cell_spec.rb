require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    before(:each) do 
        @cell = Cell.new("B4")
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
    end


end