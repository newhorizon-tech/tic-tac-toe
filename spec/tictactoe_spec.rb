require_relative '../lib/gameplay.rb'
require_relative '../lib/player.rb'

describe Gameplay do
  subject { Gameplay.new }
  describe '#initialize' do
    it 'initializes an empty tic tac toe game board with nine zeros ' do
      expect(subject.board).to eq([0, 0, 0, 0, 0, 0, 0, 0, 0])
    end
  end

  describe '#valid_move' do
    it 'gives an error if move is not provided as an argument' do
      expect { subject.valid_move }.to raise_error(ArgumentError)
    end
    it 'returns true if a move is valid i.e. cell is empty and number is between zero and none' do
      return_value = subject.valid_move(5)
      expect(return_value[0]).to eq(true)
    end
    it 'returns false as the first element of an array if number less than one' do
      return_value = subject.valid_move(-1)
      expect(return_value[0]).to eq(false)
    end
    it 'returns false as the first element of an array if number more than nine' do
      return_value = subject.valid_move(10)
      expect(return_value[0]).to eq(false)
    end

    it 'returns false if the cell in the board is already occupied' do
      subject.update_board(2, 'x')
      return_value = subject.valid_move(2)
      expect(return_value[0]).to eq(false)
    end
  end

  describe '#update_board' do
    it 'gives an error if neither the move nor the symbol are provided as arguments' do
      expect { subject.update_board }.to raise_error(ArgumentError)
    end

    it 'gives an error if only one argument (move or symbol) is provided ' do
      expect { subject.update_board(5) }.to raise_error(ArgumentError)
    end

    it 'updates the board with the given player symbol at the given position' do
      subject.update_board(5, 'x')
      expect(subject.board[4]).to eq('x')
    end
    it 'updates the board with the given player symbol at the given position' do
      subject.update_board(7, 'o')
      expect(subject.board[6]).to eq('o')
    end
  end

  describe '#game_status' do
    context 'Player one' do
      it 'return value is 1 if a player 1 has won horizontally' do
        subject.update_board(1, 'x')
        subject.update_board(2, 'x')
        subject.update_board(3, 'x')

        expect(subject.game_status).to eq(1)
      end
      it 'return value is 1 if a player 1 has won vertically' do
        subject.update_board(1, 'x')
        subject.update_board(4, 'x')
        subject.update_board(7, 'x')

        expect(subject.game_status).to eq(1)
      end
      it 'return value is 1 if a player 1 has won diagonally' do
        subject.update_board(1, 'x')
        subject.update_board(5, 'x')
        subject.update_board(9, 'x')

        expect(subject.game_status).to eq(1)
      end
    end
    context 'Player two' do
      it 'return value is 2 if a player 2 has won horizontally' do
        subject.update_board(4, 'o')
        subject.update_board(5, 'o')
        subject.update_board(6, 'o')

        expect(subject.game_status).to eq(2)
      end
      it 'return value is 1 if a player 2 has won vertically' do
        subject.update_board(2, 'o')
        subject.update_board(5, 'o')
        subject.update_board(8, 'o')

        expect(subject.game_status).to eq(2)
      end
      it 'return value is 1 if a player 2 has won diagonally' do
        subject.update_board(3, 'o')
        subject.update_board(5, 'o')
        subject.update_board(7, 'o')

        expect(subject.game_status).to eq(2)
      end
    end
    context 'Draw' do
      it 'return value is 3 when the game is a draw ' do
        subject.update_board(1, 'x')
        subject.update_board(2, 'o')
        subject.update_board(3, 'x')
        subject.update_board(7, 'o')
        subject.update_board(8, 'x')
        subject.update_board(9, 'o')
        subject.update_board(4, 'x')
        subject.update_board(5, 'o')
        subject.update_board(6, 'x')

        expect(subject.game_status).to eq(3)
      end
      context 'Game Continues. No victory or draw scenario' do
        it 'returns 0 if no one has won and board is not full' do
          subject.update_board(1, 'x')
          subject.update_board(2, 'o')
          subject.update_board(3, 'x')
          subject.update_board(7, 'o')
          subject.update_board(8, 'x')
          expect(subject.game_status).to eq(0)
        end
      end
    end
  end
end

describe Player do
  subject { Player.new('player1', 'x') }
  describe '#initialize' do
    it 'initializes player name' do
      expect(subject.player_name).to eq('player1')
    end
    it 'initializes player symbol' do
      expect(subject.player_symbol).to eq('x')
    end
    it 'does not create the object if required attribute player_symbol is missing' do
      expect { Player.new('first') }.to raise_error(ArgumentError)
    end
  end
end
