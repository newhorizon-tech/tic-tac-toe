#!/usr/bin/env ruby

def input_player
  print 'Enter your name player 1: '
  p1 = gets.chomp
  puts
  print 'Enter your name player 2: '
  p2 = gets.chomp
  [p1, p2]
end

def print_player(list)
  puts
  puts "Player 1 is #{list[0]}"
  puts "Player 2 is #{list[1]}"
end

def print_board(input)
  puts "|#{input[0]}|#{input[1]}|#{input[2]}|"
  puts ' - - -'
  puts "|#{input[3]}|#{input[4]}|#{input[5]}|"
  puts ' - - -'
  puts "|#{input[6]}|#{input[7]}|#{input[8]}|"

  puts ' - - -'
end

player_list = input_player
print_player(player_list)

board = [] # Sample tic tac toe board
9.times { board.push(0) }

turn_p1 = []
turn_p2 = []
game_on = true
def valid_move
  true
end

def draw
  false
end

def who_won
  win = 0 # 0 means no one won
  if win == 1
    puts 'Player 1 is the winner'
    break
  elsif win == 2
    puts 'Player 2 is the winner'
    break
  elsif draw
    win = 3 # 3 means draw
    puts 'Its a draw'
    break
  end
  win
end

while game_on
  puts 'Enter your choice (player 1) '
  turn_p1.push(gets.chomp.to_i)
  # check if move is valid
  puts 'Invalid move' unless valid_move
  print_board(board)
  who_won # Check if move is a winning move or a draw
  puts 'Enter your choice (player 2)'
  turn_p2.push(gets.chomp.to_i)
  # check if move is valid
  puts 'Invalid move' unless valid_move
  print_board(board)
  who_won # Check if move is a winning move or a draw
  game_on = false unless who_won.zero?
end
