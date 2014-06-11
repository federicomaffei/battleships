class BattleShips

	attr_accessor :player1, :player2

	def initialize
		@player1 = Player.new('Player 1')
		@player2 = Player.new('Player 2')
		@player2.inactive!
	end

	def print_welcome
		welcome = "WELCOME TO BATTLESHIPS"
		puts welcome
	end

	def prompt_ships(player)
		prompt = "#{player.name}: Please name a ship to place on the board"
		puts prompt
	end

	def prompt_coordinates(player)
		prompt = "#{player.name}: Please name a coordinate to place the ship on"
		puts prompt
	end

	def prompt_target(player)
		prompt = "#{player.name}: Please enter a coordinate to target"
		puts prompt
	end

	def hit_message
		message = "HIT! Please target another coordinate"
		puts message
	end

	def miss_message
		message = "MISS! The control goes to the other player"
		puts message
	end

	def get_data
		STDIN.gets.chomp
	end	

	def players_swap
		@player1.active, @player2.active = @player2.active, @player1.active
	end

	def target_ship(coordinate)
		@player1.active? ? scan_for_hits(coordinate, @player2) : scan_for_hits(coordinate, @player1)
	end

	def scan_for_hits(coordinate, player)
		if player.coordinate_defensive.ship_locations.include?(coordinate)
				player.placed_ships.each {|ship| ship.target if ship.cells.include?(coordinate)}
		end
	end



end