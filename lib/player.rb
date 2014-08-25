require_relative 'ship'
require_relative 'grid'
require_relative 'coordinate'

class Player

	attr_accessor :home_grid, :tracking_grid, :carrier, :battleship, :destroyer1, :patrol, :coordinate_defensive, :coordinate_offensive, :name, :active, :sunk_count

	def initialize(name = 'player1')
		@active = true
		@name = name
		@placed_ships = placed_ships
		@home_grid = HomeGrid.new
		@carrier = Carrier.new
		@battleship = BattleShip.new
		@destroyer1 = Destroyer.new
		@destroyer2 = Destroyer.new
		@patrol = Patrol.new
		@coordinate_defensive = Coordinate.new
		@coordinate_offensive = Coordinate.new
		@sunk_count = 0
	end

	def placed_ships
		@placed_ships ||= []
	end

	def unplaced_ships
		@unplaced_ships ||= [@carrier, @battleship, @destroyer1, @destroyer2, @patrol]
	end

	def total_ships
		@ships ||= [@carrier, @battleship, @destroyer1, @destroyer2, @patrol]
	end

	def active?
		@active
	end

	def inactive!
		@active = false
	end

	def active!
		@active = true
	end

	def place_on_grid(ship_type, coordinate)
		ship = selected_ship(ship_type).first
		update_ship_coordinates(ship, coordinate)
		if ship.cells & coordinate_defensive.ship_locations == []
			update_defensive_coordinates(ship, coordinate)
			update_grid_coordinates(ship, coordinate)
			update_ship_list(ship)
			return true
		else
			ship.cells.map! {|item| "s"}
			puts "Cannot place the #{ship.type} here!"
			return false
		end
	end

	def update_ship_coordinates(ship, coordinate)
		ship.horizontal? ? coordinate_defensive.coordinate_horizontal(ship, coordinate) : coordinate_defensive.coordinate_vertical(ship, coordinate)
	end

	def convert_latitude(coordinate)
		latitude = coordinate[1].to_i - 1
	end

	def convert_longitude(coordinate)
		longitude = coordinate[0].tr("A-Z", "1-9a-q").to_i(27) - 1 
	end

	def update_grid_coordinates(ship, coordinate)
		ship.cells.each do |coordinate|
			home_grid.positions[convert_latitude(coordinate)][convert_longitude(coordinate)] = coordinate
		end
	end

	def update_defensive_coordinates(ship, coordinate)
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
end