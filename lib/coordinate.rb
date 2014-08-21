class Coordinate

	def horizontal_coordinates
		@horizontal_coordinates = ('A'..'J').to_a
	end

	def ship_locations
		@ship_locations ||= []
	end

	def target_locations
		@target_locations ||= []
	end

	def add_ship(ship)
		ship_locations << ship
	end

	def add_target(coordinate)
		target_locations << coordinate
	end
		
	def convert_latitude(coordinate)
		if coordinate.length == 2
			latitude = coordinate[1].to_i - 1
		else
			latitude = coordinate[1..2].to_i - 1
		end
	end

	def convert_longitude(coordinate)
		longitude = coordinate[0].tr("A-Z", "1-9a-q").to_i(27) - 1 
	end

	def coordinate_horizontal(ship, coordinate)
		start = horizontal_coordinates.index(coordinate[0])
		ship.cells.map!.with_index(start) {|element, index| element = "#{@horizontal_coordinates[index]}#{coordinate[1]}"}
	end

	def coordinate_vertical(ship,coordinate)
		ship.cells.map!.with_index(0) {|element, index| element = "#{coordinate[0]}#{coordinate[1].to_i+index}"}
	end

end