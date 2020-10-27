class Gameplay
  def initialize
    @board = []
    9.times { @board.push(0) }
    @board[2] = 1
    @board[5] = 1
    @board[7] = 1
  end

  def valid_move(move)
    valid = true
    error = ''
    puts "Move is #{move}"
    puts "Move<0: #{move < 0}"
    puts "Move>9: #{move > 9}"
    puts "Move < 1 and Move > 9: #{move < 1 or move > 9}"
    if move < 1 or move > 9
      valid = false
      error = 'Number is not between 0 and 9'
    elsif !@board[move - 1].zero?
      valid = false
      error = 'The cell is not empty'
    end
    [valid, error]
  end
end

test = Gameplay.new

(-3..12).to_a.each do |i|
  test_move = test.valid_move(i)
  p test_move
  puts '-' * 40
end
