require 'pry'

class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        if self.life_points >= 0
            puts "Le joueur #{@name} à #{@life_points} point de vie "
        else
            puts "#{@name} est Mort "
        end
    end

    def gets_damage(damage)
        @life_points -= damage
        if @life_points <= 0
            puts "le joueur #{@name} est mort "
        end
    end

    def attacks(player)
        damage = compute_damage
        puts "le joueur #{@name} attaque #{player.name}"
        player.gets_damage(damage)
        puts "il lui inflige #{damage} de dommage "
    end

    def compute_damage
        return rand(1..6)
    end
end


class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{@name} à #{@life_points} est une arme de niveau #{@weapon_level} "
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon} "
        if new_weapon > @weapon_level
            @weapon_level = new_weapon
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else
            puts "M***E l'arme est trop naze pour toi"
        end
    end

    def search_health_pack

        life_pack = rand(1..6)

        if life_pack == 1
            puts "Tu n'as rien trouvé"
        elsif (life_pack >= 2 && life_pack <= 5)
            @life_points += 50
            if @life_points > 100
                @life_points = 100
            end
            puts "Hoo yeah +50 points de vie en plus pour toi"
        else life_pack == 6
            @life_points += 80
            puts "OMG tu as reçu +80 points de vie"
            if @life_points  > 100
                @life_points = 100
            end
        end
    end
end
