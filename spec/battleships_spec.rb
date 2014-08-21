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

		it 'asks the player to place ships by name' do
			prompt = "Player 1: Please name a ship to place on the board"
			expect(STDOUT).to receive(:puts).with prompt
			battleships.prompt_ships(battleships.player1)
		end

		it 'asks the player to place ships by coordinate' do
			prompt = "Player 1: Please name a coordinate to place the ship on"
			expect(STDOUT).to receive(:puts).with prompt
			battleships.prompt_coordinates(battleships.player1)
		end

		it 'allows the player to give the name of the ships' do	
			expect(STDIN).to receive(:gets).and_return("carrier\n")
			expect(battleships.get_data).to eq 'carrier'
		end

		it 'allows the player to give the coordinate of the ships' do	
			expect(STDIN).to receive(:gets).and_return("A1\n")
			expect(battleships.get_data).to eq 'A1'
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

		it 'allows the player to know that it hit a ship on a coordinate' do
			message = "MISS! The control goes to the other player"
			expect(STDOUT).to receive(:puts).with message
			battleships.miss_message
		end

		it 'allows a player to know that it won the game' do
			message = "WIN! Player 1 won Battleships!"
			expect(STDOUT).to receive(:puts).with message
			battleships.win_message(battleships.player1)
		end

		it 'updates the hit count of a ship that has been hit by player1' do
			battleships.player2.place_on_grid('carrier', 'A1')
			battleships.play_a_round('A1')
			expect(battleships.player2.carrier.hits).to eq 1
		end

		it 'updates the hit count of a ship that has been hit by player2' do
			battleships.player1.place_on_grid('carrier', 'A1')
			battleships.players_swap
			battleships.play_a_round('A1')
			expect(battleships.player1.carrier.hits).to eq 1
		end

		xit 'knows if a player won the game' do
			battleships.player2.place_on_grid('patrol', 'A1')
			battleships.play_a_round('A1')
			battleships.play_a_round('A2')
			expect(battleships.have_a_winner(battleships.player1)).to be_true
		end


	end

end


