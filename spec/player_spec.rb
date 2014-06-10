require 'player'
require 'ship'
require 'grid'

describe Player do

	let (:player) {Player.new}

	context 'when initialized' do
		it 'has 0 placed ships' do
			expect(player.placed_ships).to be_empty

		end

		it 'has 5 unplaced ships' do
			expect(player.unplaced_ships.length).to eq 5

		end

		it 'has an empty ship location list' do
			expect(player.coordinate_defense.ship_locations).to be_empty

		end
	end

	context 'can place ships on the grid' do

		it "marks with coordinates the cells of a placed ship" do
			player.place_on_grid("carrier", 'A1')
			expect(player.carrier.cells).to eq ['A1', 'A2', 'A3', 'A4', 'A5']
		end

		it 'updates the list of coordinates where a ship is present on the grid' do
			player.place_on_grid("carrier", 'A1')
			expect(player.coordinate_defense.ship_locations).to eq ['A1', 'A2', 'A3', 'A4', 'A5']
		end

		it "updating the placed_ship array" do
			player.place_on_grid("carrier", 'A1')
			expect(player.placed_ships[0].class).to be Carrier
		end

		it "updating the unplaced ship array" do
			player.place_on_grid("carrier", 'A1')
			expect(player.unplaced_ships.count).to eq 4
		end
	end


end
