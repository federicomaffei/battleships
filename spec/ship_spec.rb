require 'ship'

describe Ship do

	context "when initialized" do

		it 'can be initialized as carrier with length 5' do

			carrier = Carrier.new
			expect(carrier.type).to eq 'carrier'
			expect(carrier.length).to eq 5

		end

		it 'can be initialized as battleship with length 4' do

			battleship = BattleShip.new
			expect(battleship.type).to eq 'battleship'
			expect(battleship.length).to eq 4

		end

		it 'can be initialized as destroyer with length 3' do

			destroyer = Destroyer.new
			expect(destroyer.type).to eq 'destroyer'
			expect(destroyer.length).to eq 3

		end

		it 'can be initialized as patrol boat with length 2' do

			patrol = Patrol.new
			expect(patrol.type).to eq 'patrol'
			expect(patrol.length).to eq 2

		end

		it "is represented by a line of 's' letters of the correct length" do

			ship = Ship.new
			expect(ship.cells).to eq ['s', 's', 's']

		end

	end

	context 'hits' do

		it 'is initialized with 0 hits on it' do

			ship = Ship.new
			expect(ship.hits).to eq 0

		end

		it 'has 1 hit if targeted one time' do

			ship = Ship.new
			ship.target!
			expect(ship.hits).to eq 1

		end
	end

	context "sink state" do

		it 'is initialized as a floating ship' do

			ship = Ship.new
			expect(ship).not_to be_sunk

		end

		it 'is able to sink when targeted for all its length' do

			ship = Ship.new
			4.times {ship.target!}
			expect(ship).to be_sunk

		end
	end

end
