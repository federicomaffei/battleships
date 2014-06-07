require 'player'
require 'ship'
require 'grid'

describe Player do

	context 'when initialized' do

		it 'has 5 unplaced ships' do

			player = Player.new
			expect(player.unplaced_ships.length).to eq 5

		end

		it 'has a home grid' do

			player = Player.new
			expect(player.home_grid.class).to be HomeGrid

		end

		it 'has a tracking grid' do

			player = Player.new
			expect(player.tracking_grid.class).to be Grid

		end
	end

	context 'can place ships on the grid' do

		it "marking with 's' the positions of a ship on the grid" do

			player = Player.new
			player.place_on_grid(player.ship, 1, 1)
			expect(player.home_grid.positions[0][0..2]).to eq ['s', 's', 's']

		end
	end
end
