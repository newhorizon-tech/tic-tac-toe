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
puts test.valid_move(3)
test.update_board(3, 'x')
test.update_board(1, 'o')
test.update_board(2, 'x')
test.update_board(4, 'o')
test.update_board(5, 'x')
test.update_board(9, 'o')
test.update_board(8, 'x')
test.update_board(7, 'o')
test.update_board(6, 'x')
test.print_board
