require "coordinate"

describe Coordinate do
	let(:coordinate) {Coordinate.new}

	it "it translates a string coordinate to numeric latitude" do
		expect(coordinate.convert_latitude("A1")).to eq 0
		expect(coordinate.convert_latitude("J10")).to eq 9
	end

	it "it translates a string coordinate to numeric longitude" do
		expect(coordinate.convert_longitude("A1")).to eq 0
		expect(coordinate.convert_longitude("J10")).to eq 9
	end
end