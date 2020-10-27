#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/gameplay.rb'


  print 'Enter your name player 1: '
  p1_name = gets.chomp
  p1 = Player.new(p1_name, 'x')

  puts
  print 'Enter your name player 2: '
  p2_name = gets.chomp
  p2 = Player.new(p2_name, 'o')


def print_player
  puts "Player 1 is #{p1.player_name} and symbol is #{p1.player_symbol}"
  puts "Player 2 is #{p2.player_name} and symbol is #{p2.player_symbol} "
end

def print_board(input)
  puts "|#{input[0]}|#{input[1]}|#{input[2]}|"
  puts ' - - -'
  puts "|#{input[3]}|#{input[4]}|#{input[5]}|"
  puts ' - - -'
  puts "|#{input[6]}|#{input[7]}|#{input[8]}|"

  puts ' - - -'
end


print_player
game_on = true
game = Gameplay.new
def who_won
  win = game.who_won
  game_on = false unless win.zero?  
  if win == 1
    puts 'Player 1 is the winner'
  elsif win == 2
    puts 'Player 2 is the winner'
  elsif win == 3
    puts 'Its a draw'
  end
end

while game_on
  puts 'Enter your choice (player 1) '
  turn_p1 = gets.chomp.to_i
  turn_valid_p1 = game.valid_move(turn_p1)
  if turn_valid_p1[0]
    game.update_board(turn_p1, p1.player_symbol)
  else
    puts "Invalid move"
    puts turn_valid_p1[1]
  end

  puts 'Invalid move' unless valid_move
  print_board(board)
  who_won 
  if !game_on 
    break
  end
  puts 'Enter your choice (player 2)'
  turn_p2 = gets.chomp.to_i
  turn_valid_p2 = game.valid_move(turn_p2)
  if turn_valid_p2[0]
    game.update_board(turn_p2, p2.player_symbol)
  else
    puts "Invalid move"
    puts turn_valid_p2[1]
  end
  
  print_board(game.board)
  who_won 
  
end
