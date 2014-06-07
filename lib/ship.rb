class Ship

	attr_reader :type, :length

	def initialize(length = 4)
		@hits = 0
		@sunk = false
		@type = 'battleship'
		@length = length
		@cells = Array.new(length - 1,'s')
	end

	def cells
		@cells
	end

	def hits
		@hits
	end

	def target!
		@hits += 1
		self.sink! if @hits == @length
	end

	def sunk?
		@sunk
	end

	def sink!
		@sunk = true
	end

end

class Carrier < Ship

	def initialize
		@hits = 0
		@sunk = false	
		@type = 'carrier'
		@length = 5
		@cells = Array.new(length - 1,'s')
	end

end

class BattleShip < Ship

	def initialize
		@hits = 0
		@sunk = false
		@type = 'battleship'
		@length = 4
		@cells = Array.new(length - 1,'s')
	end

end

class Destroyer < Ship

	def initialize
		@hits = 0
		@sunk = false
		@type = 'destroyer'
		@length = 3
		@cells = Array.new(length - 1,'s')
	end

end

class Patrol < Ship

	def initialize
		@hits = 0
		@sunk = false
		@type = 'patrol'
		@length = 2
		@cells = Array.new(length - 1,'s')
	end

end