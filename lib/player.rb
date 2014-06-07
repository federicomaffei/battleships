require_relative 'ship'
require_relative 'grid'

class Player

	attr_reader :name

	def initialize(name = 'player1')
		@unplaced_ships = self.unplaced_ships
		@home_grid = HomeGrid.new
		@tracking_grid = Grid.new
		@ship = Ship.new
	end

	def unplaced_ships
		@unplaced_ships = [carrier = Carrier.new, battleship = BattleShip.new, destroyer1 = Destroyer.new, destroyer2 = Destroyer.new, patrol = Patrol.new]
	end

	def ship
		@ship
	end

	def home_grid
		@home_grid
	end

	def tracking_grid
		@tracking_grid
	end

	def place_on_grid(ship, latitude, longitude)
		@home_grid.positions[latitude - 1][longitude - 1, longitude - 1 + @ship.length] = @ship.cells
	end

end