require 'io/console'
require './board'

class Player
    def initialize(color)
        @color = color
        @name = setName()
    end

    def setName
        print "\ninsert player name: "
        @name = gets.chomp
        puts "your name is #{@name} , and you control the #{@color} pieces"
    end

    def playerTurn(board)
        chooseOrigin(board)
        #chooseTarget(board)
    end

    def chooseOrigin(board)

        while true 
            print "\ninsert position of the piece you wish to move (e.g: a5): "
            origin = gets.chomp

            unless board.squareInBoard?(origin)
                system("clear")
                board.displayBoard()
                puts "\ninvalid position, try again"
                next
            end

            choosenSquare = board.getSquare(origin)
            piece = choosenSquare.occupiedBy

            if piece.nil?
                system("clear")
                board.displayBoard()
                puts "\nthere's no piece on that position , try again"
                next
            else
                if piece.color != @color
                    system("clear")
                    board.displayBoard()
                    puts "\nyou can't move pieces from that color"
                    next
                end
            end

            break 
        end

        puts "you will move #{piece.type} in #{choosenSquare.name}"

        

    end

end

