require 'battleships'

describe BattleShips do

	let(:battleships) {BattleShips.new}

	context 'inizialization' do
		it 'creates with two players named Player 1 and Player 2' do
			expect(battleships.player1.name).to eq 'Player 1'
			expect(battleships.player2.name).to eq 'Player 2'
		end

		it 'welcomes the players with a message' do
			welcome = "WELCOME TO BATTLESHIPS"
			expect(STDOUT).to receive(:puts).with welcome
			battleships.print_welcome
		end
	end

	context 'ships placing' do
		it 'allows one player to place all 5 ships correctly' do
			expect(STDOUT).to receive(:puts).with "Player 1: Please place the carrier with the first coordinate:"
			expect(STDIN).to receive(:gets).and_return("A1")
			expect(STDOUT).to receive(:puts).with "Player 1: Please place the battleship with the first coordinate:"
			expect(STDIN).to receive(:gets).and_return("B3")
			expect(STDOUT).to receive(:puts).with "Player 1: Please place the destroyer with the first coordinate:"
			expect(STDIN).to receive(:gets).and_return("C4")
			expect(STDOUT).to receive(:puts).with "Player 1: Please place the destroyer with the first coordinate:"
			expect(STDIN).to receive(:gets).and_return("D5")
			expect(STDOUT).to receive(:puts).with "Player 1: Please place the patrol with the first coordinate:"
			expect(STDIN).to receive(:gets).and_return("F7")
			battleships.place_ships(battleships.player1)
			expect(battleships.player1.unplaced_ships.count).to eq 0
			expect(battleships.player1.placed_ships.count).to eq 5
		end

		it 'handles the case the player gets one coordinate wrong' do
			expect(STDOUT).to receive(:puts).with "Player 1: Please place the carrier with the first coordinate:"
			expect(STDIN).to receive(:gets).and_return("A1")
			expect(STDOUT).to receive(:puts).with "Player 1: Please place the battleship with the first coordinate:"
			expect(STDIN).to receive(:gets).and_return("B1")
			expect(STDOUT).to receive(:puts).with "Cannot place the battleship here!"
			expect(STDIN).to receive(:gets).and_return("B3")
			expect(STDOUT).to receive(:puts).with "Player 1: Please place the destroyer with the first coordinate:"
			expect(STDIN).to receive(:gets).and_return("C4")
			expect(STDOUT).to receive(:puts).with "Player 1: Please place the destroyer with the first coordinate:"
			expect(STDIN).to receive(:gets).and_return("D5")
			expect(STDOUT).to receive(:puts).with "Player 1: Please place the patrol with the first coordinate:"
			expect(STDIN).to receive(:gets).and_return("F7")
			battleships.place_ships(battleships.player1)
			expect(battleships.player1.unplaced_ships.count).to eq 0
			expect(battleships.player1.placed_ships.count).to eq 5
		end
	end

	context 'playing battleships' do
		it 'allows players to swap turns' do
			battleships.players_swap
			expect(battleships.player1).not_to be_active
			expect(battleships.player2).to be_active
		end

		it 'asks the player for a coordinate to target' do
			prompt = "Player 1: Please enter a coordinate to target:"
			expect(STDOUT).to receive(:puts).with prompt
			battleships.prompt_target(battleships.player1)
		end

		it 'allows the player to know that it hit a ship on a coordinate' do
			message = "HIT! Please target another coordinate:"
			expect(STDOUT).to receive(:puts).with message
			battleships.hit_message
		end

		it 'allows the player to know that it did not hit a ship on a coordinate' do
			message = "MISS! The control goes to the other player."
			expect(STDOUT).to receive(:puts).with message
			battleships.miss_message
		end

		it 'allows a player to know that it won the game' do
			message = "WIN! Player 1 won Battleships!"
			expect(STDOUT).to receive(:puts).with message
			battleships.win_message(battleships.player1)
		end

		it 'counts the times that a ship has been hit by a player' do
			battleships.player2.place_on_grid('carrier', 'A1')
			expect(STDOUT).to receive(:puts).with 'HIT! Please target another coordinate:'
			battleships.play_a_round('A1')
			expect(battleships.player2.carrier.hits).to eq 1
		end

		it 'changes active player when a shot is missed by a player' do
			battleships.player2.place_on_grid('patrol', 'A1')
			expect(STDOUT).to receive(:puts).with 'HIT! Please target another coordinate:'
			battleships.play_a_round('A1')
			expect(STDOUT).to receive(:puts).with 'MISS! The control goes to the other player.'
			battleships.play_a_round('B2')
			expect(battleships.player2).to be_active
		end

		it 'puts a message when a ship has been sunk by a player during a turn' do
			battleships.player2.place_on_grid('patrol', 'A1')
			expect(STDOUT).to receive(:puts).with 'HIT! Please target another coordinate:'
			battleships.play_a_round('A1')
			expect(STDOUT).to receive(:puts).with 'YOU SUNK A PATROL!'
			expect(STDOUT).to receive(:puts).with 'HIT! Please target another coordinate:'
			battleships.play_a_round('B1')
			expect(battleships.player2.patrol.sunk).to be_truthy
		end

		it 'knows if a player won the game' do
			battleships.player2.place_on_grid('patrol', 'A1')
			expect(STDOUT).to receive(:puts).with 'HIT! Please target another coordinate:'
			battleships.play_a_round('A1')
			expect(STDOUT).to receive(:puts).with 'YOU SUNK A PATROL!'
			expect(STDOUT).to receive(:puts).with 'HIT! Please target another coordinate:'
			expect(STDOUT).to receive(:puts).with 'Player 1 WINS BATTLESHIPS!!!!!!!!!!!!'
			battleships.play_a_round('B1')
			expect(battleships.have_a_winner(battleships.player1)).to be_truthy
		end
	end
end


