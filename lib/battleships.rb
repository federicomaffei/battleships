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

	def prompt_target
		prompt = "#{active_player.name}: Please enter a coordinate to target:"
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

	def win_message
		message = "WIN! #{active_player.name} won Battleships!"
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

	def play_a_round
		prompt_target
		scan_for_hits(STDIN.gets.chomp)
	end

	def good_round(coordinate)
		inactive_player.placed_ships.each {|ship| ship.target if ship.cells.include?(coordinate)}
		have_a_winner
	end

	def bad_round
		players_swap
		miss_message
	end

	def scan_for_hits(coordinate)
		if inactive_player.coordinate_defensive.ship_locations.include?(coordinate)
			good_round(coordinate)
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
		end
	end

	def play_game
		print_welcome
		place_ships(player1)
		place_ships(player2)
		loop do
			play_a_round
		end
	end
end