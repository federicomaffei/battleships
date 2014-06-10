require_relative 'coordinate'

class Grid

	def initialize
		@positions = Array.new(10) {Array.new(10,'m')}
	end

	def positions
		@positions ||= []
	end

end

class HomeGrid < Grid

	def initialize
		@positions = Array.new(10) {Array.new(10,'m')}
		@defense_list = Coordinate.new
	end

end