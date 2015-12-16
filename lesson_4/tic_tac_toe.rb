# tic tac toe game
# Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and
# marks a square on the board. First player to reach 3 squares in a row, including diagonals,
# wins. If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie.
# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def method_name
  
end

def display_board(pos)
  system "clear"
  puts ""
  puts "     |     |"
  puts "  #{pos[1]}  |  #{pos[2]}  |  #{pos[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{pos[4]}  |  #{pos[5]}  |  #{pos[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{pos[7]}  |  #{pos[8]}  |  #{pos[9]}"
  puts "     |     |"
  puts ""  
end

def initialize_board
  new_board = {}
  (1..9).each { |position| new_board[position] = INITIAL_MARKER }  
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_picks!(brd)
  square = ''
  loop do
    prompt "Please pick a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Not a valid choice or square"
    end
  end

  brd[square.to_i] = PLAYER_MARKER
end

def computer_picks!(brd)
  prompt "Computer picks a square"
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_wins?(brd)
  false
end

board = initialize_board
display_board(board)

loop do
  player_picks!(board)
  display_board(board)
  computer_picks!(board)
  display_board(board)
  break if someone_wins?(board) || board_full?(board)
end