require 'player'
require 'ship'
require 'grid'

describe Player do

	let (:player) {Player.new}

	context 'when initialized' do
		it 'has 0 placed ships' do
			expect(player.placed_ships).to be_empty

		end

		it 'has a home grid' do
			expect(player.home_grid.class).to be Grid

		end

		it 'has a tracking grid' do
			expect(player.tracking_grid.class).to be Grid

		end
	end

	context 'can place ships on the grid' do
		it "marks with 's' the positions of a ship on the grid" do
			player.place_on_grid("carrier", 'A1')
			expect(player.home_grid.positions[0][0..4]).to eq ['s', 's', 's', 's', 's']
		end

		it "marks with coordinates the cells of a placed ship" do
			player.place_on_grid("carrier", 'A1')
			expect(player.carrier.cells).to eq ['A1', 'A2', 'A3', 'A4', 'A5']
		end

		it 'updates the list of coordinates where a ship is present on the grid' do
			player.place_on_grid("carrier", 'A1')
			expect(player.home_grid.coordinates_with_ship).to eq ['A1', 'A2', 'A3', 'A4', 'A5']
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

	# context 'can target ships' do
	# 	it 'shooting a coordinate with a ship can change the value of the hit cell' do
	# 		player.place_on_grid("carrier", 'A1')
	# 		player.bombs('A3')
	# 		expect(player.home_grid.positions[0][2]).to eq 'h'
	# 	end
	# end

end
