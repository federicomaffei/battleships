require_relative 'ship'
require_relative 'grid'
require_relative 'coordinate'


class Player

	include Coordinate

	attr_accessor :home_grid, :tracking_grid, :carrier, :battleship, :destroyer1, :patrol
	attr_reader :name

	def initialize(name = 'player1')
		@placed_ships = placed_ships
		@home_grid = Grid.new
		@tracking_grid = Grid.new
		@carrier = Carrier.new
		@battleship = BattleShip.new
		@destroyer1 = Destroyer.new
		@destroyer2 = Destroyer.new
		@patrol = Patrol.new
	end

	def placed_ships
		@placed_ships ||= []
	end

	def unplaced_ships
		@unplaced_ships ||= [@carrier, @battleship, @destroyer1, @destroyer2, @patrol]
	end

	def place_on_grid(ship_type, coordinate)
		ship = selected_ship(ship_type).first
		update_ship_list(ship)
		home_grid.positions[convert_latitude(coordinate)][convert_longitude(coordinate), convert_longitude(coordinate) + ship.length] = ship.cells
		update_ship_coordinates(ship, coordinate)
	end

	def update_ship_coordinates(ship, coordinate)
		ship.cells.map!.with_index(0) {|element, index| element = "#{coordinate[0]}#{coordinate[1].to_i+index}"}
	end

	def update_ship_list(ship)
		placed_ships << ship
		unplaced_ships.delete_if{|s| s == ship}
	end

	def selected_ship(ship_type)
		unplaced_ships.select do |s| 
			s.type == ship_type
		end
	end

	def bombs(coordinate)
		latitude = convert_latitude(coordinate)
		longitude = convert_longitude(coordinate)
		
	end

end