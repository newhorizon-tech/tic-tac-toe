#!/usr/bin/env ruby

def player_name
puts "Enter your name player 1"
p1 = gets.chomp
puts "Enter your name player 2"
p2 = gets.chomp
return [p1, p2]
end

def print_board(input)
        puts "|1|2|3|"
        puts "_ _ _"
        puts "|4|5|6|"
        puts "_ _ _"
        puts "|7|8|9|"
        puts "_ _ _ "
end


player_list = player_name
p player_list

board = [0,0,0,0,0,0,0,0,0]
turn_p1 = []
turn_p2 = []
win = false
while !win do
    puts "Enter your choice (player 1) "
    turn_p1.push(gets.chomp.to_i)
    #check if move is valid
    print_board(board)
    if check_win == true
         win = true 
        puts "Player 1 wins"
        break
    end
    puts "Enter your choice (player 2)"
    turn_p2.push(gets.chomp.to_i)
    #check if move is valid
    print_board(board)
    if check_win == true
        win = true 
       puts "Player 2 wins"
       break
   end
end


    

