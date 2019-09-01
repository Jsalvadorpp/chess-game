require 'io/console'
require './board'

class Player
    def initialize(color)
        @color = color
        @name = nil
        setName()
    end

    def setName
        print "\ninsert player name: "
        @name = gets.chomp
        puts "your name is #{@name} , and you control the #{@color} pieces"
    end

    def playerTurn(board)
        origin = chooseOrigin(board)
        #target = chooseTarget(board)
    end

    def chooseOrigin(board)

        while true 
            system("clear")
            board.displayBoard()
            print "\n#{@name} -> insert position of the piece you wish to move (e.g: a5): "
            origin = gets.chomp

            unless board.squareInBoard?(origin)
                puts "\ninvalid position, try again"
                next
            end

            choosenSquare = board.getSquare(origin)
            piece = choosenSquare.occupiedBy

            if piece.nil?
                puts "\nthere's no piece on that position , try again"
                next
            else
                if piece.color != @color
                    puts "\nyou can't move pieces from that color"
                    next
                end
            end

            if piece.availableMoves(board).nil?
                puts "\nno available moves for this pieces"
                next
            end

            break 
        end
        
        puts "you will move #{piece.type} in #{choosenSquare.name}"
        return choosenSquare
    end

  

end

