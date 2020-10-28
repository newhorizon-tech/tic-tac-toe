class Gameplay
  attr_reader :board
  def initialize
    @board = []
    9.times { @board.push(0) }
  end

  def valid_move(move)
    valid = true
    error = ''
    if move < 1 or move > 9
      valid = false
      error = 'Number is not between 0 and 9'
    elsif @board[move - 1].is_a? String
      valid = false
      error = 'The cell is not empty'
    end
    [valid, error]
  end

  def update_board(move, player)
    @board[move - 1] = player
  end

  def who_won
    return_value = 0
    win = false
    horizontal = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    vertical = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    diagonal = [[0, 4, 8], [2, 4, 6]]
    winning_combo = [horizontal, vertical, diagonal].flatten(1).freeze
    winning_combo.each do |combo|
      if combo.all? { |position| @board[position].eql? 'x' } # Checking if 'x' has won
        win = true
        return 1
      elsif combo.all? { |position| @board[position].eql? 'o' } # Checking if 'o' has won
        win = true
        return 2
      end
    end
    return 3 if !win and @board.all? { |element| element.is_a? String } # Checking for a draw
    return_value
  end
end
