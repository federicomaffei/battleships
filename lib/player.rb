require_relative 'ship'
require_relative 'grid'
require_relative 'coordinate'


class Player

	attr_accessor :home_grid, :tracking_grid, :carrier, :battleship, :destroyer1, :patrol, :coordinate_defensive, :coordinate_offensive
	attr_reader :name

	def initialize(name = 'player1')
		@placed_ships = placed_ships
		@carrier = Carrier.new
		@battleship = BattleShip.new
		@destroyer1 = Destroyer.new
		@destroyer2 = Destroyer.new
		@patrol = Patrol.new
		@coordinate_defensive = Coordinate.new
		@coordinate_offensive = Coordinate.new
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
		update_ship_coordinates(ship, coordinate)
		update_grid_coordinates(ship, coordinate)
	end

	def update_ship_coordinates(ship, coordinate)
		ship.cells.map!.with_index(0) {|element, index| element = "#{coordinate[0]}#{coordinate[1].to_i+index}"}
	end

	def update_grid_coordinates(ship, coordinate)
		ship.cells.each {|s| coordinate_defensive.add_ship(s)}
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

	def targets(coordinate)
		coordinate_offensive.add_target(coordinate)
	end

end