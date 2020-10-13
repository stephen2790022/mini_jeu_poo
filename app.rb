require 'bundler'

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("josiane")
player2 = Player.new("josé")

while player1.life_points > 0 && player2.life_points > 0
    puts "Voici l'état de nos joueurs :"
      player1.show_state
      player2.show_state
      puts
  
      puts "Passons à la phase d'attaque :"
      player1.attacks(player2)
          if player2.life_points <= 0
              break
          end
      player2.attacks(player1)
          if player1.life_points <= 0
              break
          end
      puts
  end
