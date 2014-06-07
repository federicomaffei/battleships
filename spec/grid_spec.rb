require 'grid'
require 'ship'

describe Grid do

	context 'structure' do

		it 'is defined as an array' do

			grid = Grid.new
			expect(grid.positions.class).to be Array

		end

		it 'has length and width 10' do

			grid = Grid.new
			expect(grid.positions.length).to eq 10
			expect(grid.positions[0].length).to eq 10

		end
	end

	context 'can mark hits and misses' do

		it "writing 'h' on the hit coordinate" do

			grid = Grid.new
			grid.mark_hit_on(1,1)
			expect(grid.positions[0][0]).to eq 'h'

		end
	end

	context 'home grid' do

		it 'is initialized with no ships on it' do

			home_grid = HomeGrid.new
			expect(home_grid.battling_ships).to be_empty

		end

		it 'can receive a ship and add it to the list' do

			ship = Ship.new
			home_grid = HomeGrid.new
			home_grid.receives(ship)
			expect(home_grid.battling_ships.length).to eq 1

		end
	end

end