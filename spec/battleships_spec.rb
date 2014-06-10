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

		it 'asks the user to place ships' do
			prompt = "Player 1: Please place a ship on the board"
			expect(STDOUT).to receive(:puts).with prompt
			battleships.prompt_ships(battleships.player1)
			prompt = "Player 2: Please place a ship on the board"
			expect(STDOUT).to receive(:puts).with prompt
			battleships.prompt_ships(battleships.player2)
		end

	end

	context 'playing battleships' do

		it 'allows players to swap turns' do
			battleships.players_swap
			expect(battleships.player1).not_to be_active
			expect(battleships.player2).to be_active
		end

	end




end


