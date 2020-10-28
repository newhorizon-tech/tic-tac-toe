#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/gameplay.rb'

print 'Enter your name player 1: '
p1_name = gets.chomp
p1 = Player.new(p1_name, 'x')

print 'Enter your name player 2: '
p2_name = gets.chomp
p2 = Player.new(p2_name, 'o')

def print_player(p1, p2)
  puts '*' * 40
  puts 'Player information'
  puts "Player 1 is #{p1.player_name} and symbol is #{p1.player_symbol}"
  puts "Player 2 is #{p2.player_name} and symbol is #{p2.player_symbol} "
  puts '*' * 40
end

print_player(p1, p2)

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
  win = game.who_won
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
  puts "Enter your choice, #{p1.player_name} "
  turn_p1 = gets.chomp.to_i
  turn_valid_p1 = game.valid_move(turn_p1)
  if turn_valid_p1[0]
    game.update_board(turn_p1, p1.player_symbol)
  else
    puts 'Invalid move'
    puts turn_valid_p1[1]
    until turn_valid_p1[0]
      puts "Enter your choice again, #{p1.player_name}. Make sure it's a valid choice "
      turn_p1 = gets.chomp.to_i
      turn_valid_p1 = game.valid_move(turn_p1)
    end
    game.update_board(turn_p1, p1.player_symbol) if turn_valid_p1[0]
  end
  print_board(game.board)
  game_on = who_won(game, game_on)
  break unless game_on
  puts "Enter your choice, #{p2.player_name} "
  turn_p2 = gets.chomp.to_i
  turn_valid_p2 = game.valid_move(turn_p2)
  if turn_valid_p2[0]
    game.update_board(turn_p2, p2.player_symbol)
  else
    puts 'Invalid move'
    puts turn_valid_p2[1]
    until turn_valid_p2[0]
      puts "Enter your choice again, #{p2.player_name}. Make sure it's a valid choice "
      turn_p2 = gets.chomp.to_i
      turn_valid_p2 = game.valid_move(turn_p2)
    end
    game.update_board(turn_p2, p2.player_symbol) if turn_valid_p2[0]
  end
  print_board(game.board)
  game_on = who_won(game, game_on)
end
