require 'player'
require 'ship'
require 'grid'

describe Player do

	let (:player) {Player.new}

	context 'initializing' do
		it 'has 0 placed ships' do
			expect(player.placed_ships).to be_empty

		end

		it 'has 5 unplaced ships' do
			expect(player.unplaced_ships.length).to eq 5

		end

		it 'has an empty ship location list' do
			expect(player.coordinate_defensive.ship_locations).to be_empty
		end
	end

	context 'placing ships on the grid' do
		it "ship cells list gets updated" do
			player.place_on_grid("carrier", 'A1')
			expect(player.carrier.cells).to eq ['A1', 'B1', 'C1', 'D1', 'E1']
		end

		it "the list of coordinates gets updated" do
			player.place_on_grid("carrier", 'A1')
			expect(player.coordinate_defensive.ship_locations).to eq ['A1', 'B1', 'C1', 'D1', 'E1']
		end

		it "the list of placed ships gets updated" do
			player.place_on_grid("carrier", 'A1')
			expect(player.placed_ships[0].class).to be Carrier
		end

		it "the list of unplaced ships gets updated" do
			player.place_on_grid("carrier", 'A1')
			expect(player.unplaced_ships.count).to eq 4
		end

		it "does not allow to place a ship in same coordinates as another" do
			expect(STDOUT).to receive(:puts).with 'Cannot place the patrol here!'
			player.place_on_grid("carrier", 'A1')
			player.place_on_grid("patrol", 'E1')
			expect(player.unplaced_ships.count).to eq 4
			expect(player.patrol.cells).to eq ['s', 's']
		end
	end

	context 'playing battleships' do
		it "knows if it's its turn to play or not" do
			expect(player).to be_active
			player.inactive!
			expect(player).not_to be_active
		end
	end
end
