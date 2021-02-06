require "./Node.cr"
require "./Player"

class Board
    getter nodes : Array(Node)
    property barques : Array(Int32) = [1, 2, 3]
    property rageCerbere : Int32
    property vitesseCerbere : Int32
    property players : Array(Player) = [] of Player

    def initialize(difficulty : Int32, users : Array(User))

        # Choix du plateau
        # Seulement difficulte 0 disponible pour l'instant
        case difficulty
        when 0
            @nodes = BOARD_0
        when 1
            @nodes = BOARD_0
        when 2
            @nodes = BOARD_0
        else
            @nodes = BOARD_0
        end

        # Creation d'un Player pour chaque User
        @players.new
        users.each do |user|
            @players << Player.new(user.userId)
        end

        # Ajout de Cerbere en fin de tableau
        @players << Player.new(0,0)

        # Initialisation des variables de jeu
        @rageCerbere = 8 - users.size
        @vitesseCerbere = 3 + difficulty # A redefinir
        @barques.shuffle!
    end
end