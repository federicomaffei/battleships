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
		it "marks a hit on a coordinate that has a ship" do
			grid = Grid.new
			grid.positions[0][0] = 's'
			grid.checks_hit_on('A1')
			expect(grid.positions[0][0]).to eq 'h'
		end
	end
end