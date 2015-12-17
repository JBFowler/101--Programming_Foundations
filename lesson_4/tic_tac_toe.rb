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
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
@player_score = 0
@computer_score = 0

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(pos)
  system "clear"
  puts "Player uses #{PLAYER_MARKER}, computer uses #{COMPUTER_MARKER}."
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

# rubocop:enable Metrics/AbcSize
def initialize_board
  new_board = {}
  (1..9).each { |position| new_board[position] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, punct = ', ', conj = 'or')
  array[array.index(array.last)] = "#{conj} #{array.last}" if array.size > 1
  array.join(punct)
  # array[-1] = "#{conj} {array.last}" if array.size > 1
  # arr.join(punct)
end

def player_picks!(brd)
  square = ''
  loop do
    prompt "Please pick a square: #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Not a valid choice or square"
    end
  end

  brd[square.to_i] = PLAYER_MARKER
end

def immediate_threat(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_picks!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = immediate_threat(line, brd)
    break if square
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_wins?(brd)
  !!detect_winner(brd)
end

def add_to_score!(brd)
  if detect_winner(brd) == 'Player'
    @player_score += 1
  elsif detect_winner(brd) == 'Computer'
    @computer_score += 1
  end
end

def reset_scores
  @player_score = 0
  @computer_score = 0
end

def first_to_five
  if @player_score == 5
    prompt "You scored 5 points and are the winner!"
    reset_scores
  elsif @computer_score == 5
    prompt "The computer scored 5 points and wins!"
    reset_scores
  else
    puts "Scores".center(39, '-')
    puts "".center(39, '-')
    puts "Player: #{@player_score}  ||  Computer: #{@computer_score}".center(40, '-')
  end
end

loop do
  board = initialize_board

  loop do
    display_board(board)
    player_picks!(board)
    break if someone_wins?(board) || board_full?(board)
    computer_picks!(board)
    break if someone_wins?(board) || board_full?(board)
  end

  display_board(board)

  if someone_wins?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  add_to_score!(board)
  first_to_five

  prompt "Play again? (Y/N)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Goodbye!"
