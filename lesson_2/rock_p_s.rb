# A simple rock paper scissors game
require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')
WEAPONS = %w(rock paper scissors)
player_score = nil
npc_score = nil

def prompt(msg, arg = '')
  if arg.empty?
    puts "=> #{msg}"
  else
    puts "=> #{msg}" + "#{arg}"
  end
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def winning_weapon?(wep, winner)
  if wep == 'rock'
    prompt(MESSAGES['rock'], MESSAGES[winner])
  elsif wep == 'paper'
    prompt(MESSAGES['paper'], MESSAGES[winner])
  else
    prompt(MESSAGES['scissors'], MESSAGES[winner])
  end
end

def display_results(player, npc)
  if win?(player, npc)
    winning_weapon?(player, 'player_wins')
  elsif win?(npc, player)
    winning_weapon?(npc, 'computer_wins')
  else
    prompt(MESSAGES['tie'])
  end
end

prompt(MESSAGES['welcome'])
name = gets.chomp

loop do
  if name.empty?
    prompt(MESSAGES['name_error'])
    name = gets.chomp
  else
    prompt(MESSAGES['welcome_player'], name)
    break
  end
end

loop do
  player_weapon = ''
  loop do
    prompt(MESSAGES['choose_weapon'], WEAPONS.join(', '))
    player_weapon = gets.chomp.downcase

    if WEAPONS.include?(player_weapon)
      prompt(MESSAGES['player_choice'], player_weapon)
      break
    else
      prompt(MESSAGES['invalid_weapon'])
    end
  end

  npc_weapon = WEAPONS.sample
  prompt(MESSAGES['npc_choice'], npc_weapon)

  display_results(player_weapon, npc_weapon)
  prompt(MESSAGES['play_again'])
  again = gets.chomp

  break unless again.downcase.start_with?('y')
end

prompt(MESSAGES['thank_you'])
