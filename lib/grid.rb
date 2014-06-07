class Grid

	def initialize
		@positions = Array.new(10) {Array.new(10,'m')}
	end

	def positions
		@positions ||= []
	end

	def mark_hit_on(latitude, longitude)
		self.positions[latitude - 1][longitude - 1] = 'h'
	end

end

class HomeGrid < Grid

	def initialize
		@positions = Array.new(10) {Array.new(10,'m')}
		@battling_ships = battling_ships
	end

	def battling_ships
		@battling_ships ||= []
	end

	def receives(ship)
		battling_ships << ship
	end

end