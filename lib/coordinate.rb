module Coordinate
		
	def convert_latitude(coordinate)
		latitude = coordinate[0].tr("A-Z", "1-9a-q").to_i(27) - 1
	end

	def convert_longitude(coordinate)
		longitude = coordinate[1].to_i - 1
	end				

end