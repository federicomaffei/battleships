require "coordinate"

class CoordinateHolder; include Coordinate; end

describe Coordinate do
	let(:coordinate) {CoordinateHolder.new}

	it "it translates a string coordinate to numeric latitude" do
		expect(coordinate.convert_latitude("A1")).to eq 0
		expect(coordinate.convert_latitude("J10")).to eq 9
	end

	it "it translates a string coordinate to numeric longitude" do
		expect(coordinate.convert_longitude("A1")).to eq 0
	end
end