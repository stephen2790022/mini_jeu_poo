require 'bundler'
require_relative 'lib/game'
require_relative 'lib/player'





def home
  puts "-------------------------------------------------"
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts "-------------------------------------------------"
end

def init_player
  print "Quel est ton nom ? "
  player_name = gets.chomp
  puts "Bonjour #{player_name} !"
  player_man = HumanPlayer.new(player_name)
  puts "J'ai créé ton avatar !"
  return player_man
end

home


human_being = init_player
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1,player2]

while (player1.life_points > 0 || player2.life_points > 0) && human_being.life_points > 0
    system("clear")
  puts "**********************************"
  puts "Quelle action veux-tu effectuer ? "
  puts
  puts " 1- chercher une meilleure arme"
  puts " 2- chercher à se soigner "
  puts
  puts " 3- Taper #{player1.name} "
  puts " 4- Taper #{player2.name} "
  puts " 0- Pour quitter le jeux"
  puts


    puts "Voici l'état de nos joueurs :"
      player1.show_state
      player2.show_state
      human_being.show_state
    puts

    print "> Numero: "
    choice = gets.chomp

    puts
    case choice

        when "1"
            human_being.search_weapon
        when "2" 
            human_being.search_health_pack
        when "3"
            human_being.attacks(player1)
        when "4"
            human_being.attacks(player2)
    end

    puts

    enemies.each do |p|
        if p.life_points > 0
            p.attacks(human_being)
            if human_being.life_points <= 0
                puts "You are dead"
                break
            end
        end
    end
    if enemies[0].life_points <= 0 && enemies[1].life_points <= 0 
        enemies[0].show_state
        enemies[1].show_state
        puts "Tous les connards sont mort"
    end
    puts
    print "Appuye sur une touche pour continuer"
    gets.chomp
end
