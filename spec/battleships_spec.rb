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
			prompt = "Player 1: Please enter a coordinate to target"
			expect(STDOUT).to receive(:puts).with prompt
			battleships.prompt_target(battleships.player1)
		end

	end

end


