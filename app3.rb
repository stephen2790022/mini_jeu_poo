 
require 'bundler'


require_relative 'lib/game'
require_relative 'lib/player'


puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

print "Quel est ton nom ? "
player_name = gets.chomp
puts "Bonjour #{player_name} !"

my_game = Game.new(player_name)
while my_game.is_still_ongoing?
  my_game.menu
  my_game.menu_choice
	my_game.show_players
	my_game.enemies_attack
	my_game.show_players
end
my_game.end