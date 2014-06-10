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
		prompt = "#{player.name}: Please place a ship on the board"
		puts prompt
	end

	def players_swap
		@player1.active, @player2.active = @player2.active, @player1.active
	end

end