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
win = false
until win
  puts 'Enter your choice (player 1) '
  turn_p1.push(gets.chomp.to_i)
  # check if move is valid
  print_board(board)
  # Check if player one has won
  if win == 1
    puts 'Player 1 wins'
    break
  end
  puts 'Enter your choice (player 2)'
  turn_p2.push(gets.chomp.to_i)
  # check if move is valid
  print_board(board)
  # Check if player two has won
  if win == 2
    puts 'Player 2 wins'
    break
  end
end
