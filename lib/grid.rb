require_relative 'coordinate'

class Grid

	include Coordinate

	def initialize
		@positions = Array.new(10) {Array.new(10,'m')}
	end

	def positions
		@positions ||= []
	end

	def checks_hit_on(coordinate) 
		self.positions[convert_latitude(coordinate)][convert_longitude(coordinate)] = 'h' if self.positions[convert_latitude(coordinate)][convert_longitude(coordinate)] = 's'
	end

end