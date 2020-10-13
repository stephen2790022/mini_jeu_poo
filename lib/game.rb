require_relative 'player'

class Game
    attr_accessor :human_player, :enemies

    def initialize(human)
        @human_player = HumanPlayer.new(human)
        @enemies = [Player.new("Sniper lux"), Player.new("Kassadin"), Player.new("Katarina"), Player.new("jhin")]
    end

    def kill_player
        @enemies.each do |gamer|
            if gamer.life_points <= 0
                @enemies.delete(gamer)
            end
        end
    end

    def is_still_ongoing?
        if @human_player.life_points > 0 && !@enemies.empty?
            return true
        else
            return false
        end
    end   
    
    def show_players
        @human_player.show_state
        puts "Il reste #{@enemies.count} ennemis en jeu."
    end

    def menu
        
        puts "*********************************"
        puts "Quelle action veux-tu effectuer ? "
        puts
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner "
        puts
        puts "attaquer un joueur en vue :"
        i = 0
        @enemies.each do |enemie|
          if enemie.life_points > 0
            print "#{i} - "
            enemie.show_state
            i += 1
          end
        end
      end

    def menu_choice()
            puts
            puts "Votre choix ?"
            choice = gets.chomp
            puts "----------------------------------"
            if choice == "a"
              @human_player.search_weapon
            elsif choice == "s"
              @human_player.search_health_pack
            
            elsif choice == "0" || choice == "1" || choice == "2" || choice == "3"
              position = choice.to_i
              if position <= @enemies.count-1  
                if @enemies[position].life_points > 0
                  @human_player.attacks(enemies[position])
                  kill_player    
                end
              else
                puts "NO NO, tant pis pour toi !"
              end
            else
              puts "Alalala T_T pourquoi tu trolle Appuie sur: a ou s ou un chifre de 0 à 3..."
            end
    end


    def enemies_attack
        puts "----------------------------------" 
        puts "Les autres joueurs t'attaquent !"
        @enemies.each do | enemie |
          if enemie.life_points > 0
            enemie.attacks(@human_player)
          end
        end
    end

    def end
        puts "**********************************"
        puts "*** La partie est finie ***"
        if @human_player.life_points > 0
          puts "BRAVO ! WHAT A GAMEEEE !"
        else 
          puts "BOUUUUUU ! Tu as perdu !"
        end
        puts "**********************************"
      end
    end
    
    
    
    
    #@enemies.each do |enemi|
    #    enmi.life_points  <=  0 ?  puts ""  :  puts " tape sur machin"
    #end
    
    
    
    
    
    
    
    #def menu_choice
        #choice = gets.chomp
        #case choice
        #
        #    when "1"
        #        @human_player.search_weapon
        #    when "2" 
        #        @human_player.search_health_pack
        #    when "3"
        #        @human_player.attacks(@enemies[0])
        #    when "4"
        #        @human_player.attacks(@enemies[1])
        #    when "5"
        #        @human_player.attacks(@enemies[2])
        #    when "6"
        #        @human_player.attacks(@enemies[3])
        #end  
        #end
        
        
        #def enemies_attack
        #    enemies.each do |p|
        #        if p.life_points <= 0
        #            kill_player
    #        end
    #        if p.life_points > 0
    #            p.attacks(@human_player)
    #            if @human_player.life_points <= 0
    #                puts "You are dead"
    #                break
    #            end
    #        end
    #    end
    #end

    #def end
    #    if enemies[0].life_points <= 0 && enemies[1].life_points <= 0 && enemies[2].life_points <= 0 && enemies[3].life_points <= 0
    #        enemies[0].show_state
    #        enemies[1].show_state
    #        puts "Tous les connards sont morts"
    #    end
    #end