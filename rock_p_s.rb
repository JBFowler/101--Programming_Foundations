# A simple rock paper scissors game
require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')
WEAPONS = %w(rock paper scissors)

def prompt(msg, arg='')
  if arg.empty?
    puts "=> #{msg}"
  else
    puts "=> #{msg}" + "#{arg}."
  end
end

def display_results(player, npc)
  if npc == player
    prompt(MESSAGES['tie'])
  elsif npc == 'rock' && player == 'paper'
    prompt(MESSAGES['player_paper'])
  elsif npc == 'rock' && player == 'scissors'
    prompt(MESSAGES['npc_rock'])
  elsif npc == 'paper' && player == 'scissors'
    prompt(MESSAGES['player_scissors'])
  elsif npc == 'paper' && player == 'rock'
    prompt(MESSAGES['npc_paper'])
  elsif npc == 'scissors' && player == 'rock'
    prompt(MESSAGES['player_rock'])
  elsif npc == 'scissors' && player == 'paper'
    prompt(MESSAGES['npc_scissors'])
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
