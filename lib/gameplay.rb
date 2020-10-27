class Gameplay
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
    elsif !@board[move - 1].zero?
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
    horizontal = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    vertical = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    diagonal = [[0, 4, 8], [2, 4, 6]]
    winning_combo = [horizontal, vertical, diagonal].flatten(1)
    winning_combo.each do |combo|
      if combo.all? { |position| @board[position].eql? 'x' } # Checking if 'x' has won
        return 1
      elsif combo.all? { |position| @board[position].eql? 'o' } # Checking if 'o' has won
        return 2
      elsif @board.all? { |element| element.is_a? String } # Checking for a draw
        return 3
      end
    end
    return_value
  end

  def print_board
    puts '-' * 40
    puts "|#{@board[0]}|#{@board[1]}|#{@board[2]}|"
    puts ' - - -'
    puts "|#{@board[3]}|#{@board[4]}|#{@board[5]}|"
    puts ' - - -'
    puts "|#{@board[6]}|#{@board[7]}|#{@board[8]}|"
    puts ' - - -'
    puts '-' * 40
  end
end

test = Gameplay.new
test.update_board(3, 'x')
test.update_board(1, 'o')
test.update_board(2, 'x')
test.update_board(7, 'o')
test.update_board(5, 'x')
test.update_board(8, 'o')
test.update_board(4, 'x')
test.update_board(6, 'o')
test.print_board

puts test.who_won
