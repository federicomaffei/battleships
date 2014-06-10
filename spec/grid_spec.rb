require 'grid'

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
end