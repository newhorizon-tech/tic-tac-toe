require_relative '../lib/gameplay.rb'
require_relative '../lib/player.rb'

# def print_board(board_arr)
#   input = []
#   board_arr.each do |x|
#     if x.is_a? Integer and x.zero?
#       input.push(' ')
#     else
#       input.push(x)
#     end
#   end
#   puts '*' * 40
#   puts 'Currect state of the game'
#   puts ' - - -'
#   puts "|#{input[0]}|#{input[1]}|#{input[2]}|"
#   puts ' - - -'
#   puts "|#{input[3]}|#{input[4]}|#{input[5]}|"
#   puts ' - - -'
#   puts "|#{input[6]}|#{input[7]}|#{input[8]}|"
#   puts ' - - -'
#   puts '*' * 40
# end

# puts 'RSpec is working!'

describe Gameplay do
  subject { Gameplay.new }
  describe '#initialize' do
    it 'initializes an empty tic tac toe game board with nine zeros ' do
      expect(subject.board).to eq([0, 0, 0, 0, 0, 0, 0, 0, 0])
    end
  end

  describe '#valid_move' do
    it 'returns false as the first element of an array if number less than one' do
      return_value = subject.valid_move(-1)
      expect(return_value[0]).to eq(false)
    end
    it 'returns false as the first element of an array if number more than nine' do
      return_value = subject.valid_move(10)
      expect(return_value[0]).to eq(false)
    end
  end

  describe "#update_board" do
    it "updates the board with the given player symbol at the given position" do
      subject.update_board(5, 'x')
      expect(subject.board[5]).to eq('x')
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
    end
  end
end
