require './lib/ship'

RSpec.describe Ship do
    before(:each) do
        @cruiser = Ship.new("Cruiser", 3)
    end

    describe '#Initialize' do
        it 'can initialize' do
            expect(@cruiser).to be_an_instance_of Ship
        end

        it 'has attributes' do
            expect(@cruiser.name).to eq "Cruiser"
            expect(@cruiser.length).to eq 3
            expect(@cruiser.health).to eq 3
        end
    end

    describe 'combat' do
        it 'sets sunk default to false' do
            expect(@cruiser.sunk?).to be false
        end

        it 'have health decrease with hit' do
            expect(@cruiser.health).to eq 3

            @cruiser.hit

            expect(@cruiser.health).to eq 2
        end

        it 'can sink after hits' do
            expect(@cruiser.health).to eq 3

            @cruiser.hit
            @cruiser.hit
            @cruiser.hit

            expect(@cruiser.health).to eq 0
            expect(@cruiser.sunk?).to be true
        end
    end
end