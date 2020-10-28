#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/gameplay.rb'

print 'Enter your name player 1: '
play1_name = gets.chomp
play1 = Player.new(play1_name, 'x')

print 'Enter your name player 2: '
play2_name = gets.chomp
play2 = Player.new(play2_name, 'o')

def print_player(play1, play2)
  puts '*' * 40
  puts 'Player information'
  puts "Player 1 is #{play1.player_name} and symbol is #{play1.player_symbol}"
  puts "Player 2 is #{play2.player_name} and symbol is #{play2.player_symbol} "
  puts '*' * 40
end

print_player(play1, play2)

def print_board(board_arr)
  input = []
  board_arr.each do |x|
    if x.is_a? Integer and x.zero?
      input.push(' ')
    else
      input.push(x)
    end
  end
  puts '*' * 40
  puts 'Currect state of the game'
  puts ' - - -'
  puts "|#{input[0]}|#{input[1]}|#{input[2]}|"
  puts ' - - -'
  puts "|#{input[3]}|#{input[4]}|#{input[5]}|"
  puts ' - - -'
  puts "|#{input[6]}|#{input[7]}|#{input[8]}|"
  puts ' - - -'
  puts '*' * 40
end
board = []
9.times { board.push(0) }

game_on = true
game = Gameplay.new

def who_won(game, game_on)
  win = game.game_status
  game_on = false unless win.zero?
  if win == 1
    puts '-' * 40
    puts 'Player 1 is the winner!'
    puts '-' * 40
  elsif win == 2
    puts '-' * 40
    puts 'Player 2 is the winner!'
    puts '-' * 40
  elsif win == 3
    puts '-' * 40
    puts 'Its a draw'
    puts '-' * 40
  end
  game_on
end

while game_on
  puts '-' * 40
  puts "Enter your choice, #{play1.player_name} "
  turn_play1 = gets.chomp.to_i
  turn_valid_play1 = game.valid_move(turn_play1)
  until turn_valid_play1[0]
    puts 'Invalid move'
    puts turn_valid_play1[1]
    puts "Enter your choice again, #{play1.player_name}. Make sure it's a valid choice "
    turn_play1 = gets.chomp.to_i
    turn_valid_play1 = game.valid_move(turn_play1)
  end
  game.update_board(turn_play1, play1.player_symbol) # if turn_valid_play1[0]

  print_board(game.board)
  game_on = who_won(game, game_on)
  break unless game_on

  puts "Enter your choice, #{play2.player_name} "
  turn_play2 = gets.chomp.to_i
  turn_valid_play2 = game.valid_move(turn_play2)
  until turn_valid_play2[0]
    puts 'Invalid move'
    puts turn_valid_play2[1]
    puts "Enter your choice again, #{play1.player_name}. Make sure it's a valid choice "
    turn_play2 = gets.chomp.to_i
    turn_valid_play2 = game.valid_move(turn_play2)
  end
  game.update_board(turn_play2, play2.player_symbol) # if turn_valid_play2[0]

  print_board(game.board)
  game_on = who_won(game, game_on)
end
