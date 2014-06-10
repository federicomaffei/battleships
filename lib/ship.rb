class Ship

	attr_accessor :type, :length, :cells, :hits, :sunk

	def initialize(length = 4)
		@hits = 0
		@sunk = false
		@type = 'battleship'
		@length = length
		@cells = Array.new(length,'s')
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
		super	
		@type = 'carrier'
		@length = 5
		@cells = Array.new(length,'s')
	end

end

class BattleShip < Ship

	def initialize
		super
		@type = 'battleship'
		@length = 4
		@cells = Array.new(length,'s')
	end

end

class Destroyer < Ship

	def initialize
		super
		@type = 'destroyer'
		@length = 3
		@cells = Array.new(length,'s')
	end

end

class Patrol < Ship

	def initialize
		super
		@type = 'patrol'
		@length = 2
		@cells = Array.new(length,'s')
	end

end