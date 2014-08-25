require_relative 'player'

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

	def inactive_player
		@player1.active? ? @player2 : @player1
	end

	def active_player
		@player1.active? ? @player1 : @player2
	end

	def prompt_target(player)
		prompt = "#{player.name}: Please enter a coordinate to target:"
		puts prompt
	end

	def hit_message
		message = "HIT!"
		puts message
	end

	def miss_message
		message = "MISS! The control goes to the other player."
		puts message
	end

	def win_message(player)
		message = "WIN! #{player.name} won Battleships!"
		puts message
	end

	def get_data
		STDIN.gets.chomp
	end

	def place_ships(player)
		player.total_ships.each do |ship|
			puts "#{player.name}: Please place the #{ship.type} with the first coordinate:"
			unless player.place_on_grid(ship.type, get_data) == true
				player.place_on_grid(ship.type, get_data)
			end
		end
	end

	def players_swap
		@player1.active, @player2.active = @player2.active, @player1.active
	end

	def play_a_round(player)
		prompt_target(player)
		coordinate = STDIN.gets.chomp
		@player1.active? ? scan_for_hits(coordinate, @player2) : scan_for_hits(coordinate, @player1)
	end

	def good_round(coordinate, player)
		player.placed_ships.each {|ship| ship.target if ship.cells.include?(coordinate)}
	end

	def bad_round
		players_swap
		miss_message
		prompt_target(active_player)
	end

	def scan_for_hits(coordinate, player)
		if player.coordinate_defensive.ship_locations.include?(coordinate)
			good_round(coordinate, player)
			hit_message
		else bad_round
		end
	end

	def have_a_winner
		inactive_player.placed_ships.each do |ship|
			active_player.sunk_count += 1 if ship.sunk?
		end
		if active_player.sunk_count == inactive_player.placed_ships.count
			puts "#{active_player.name} WINS BATTLESHIPS!!!!!!!!!!!!"
			return true 
		end
	end

	def play_game
		print_welcome
		place_ships(player1)
		place_ships(player2)
		loop do
			play_a_round(active_player)
			have_a_winner
		end
	end
end