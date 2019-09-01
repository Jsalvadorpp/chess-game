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
        chooseTarget(board,origin)
    end

    def chooseOrigin(board)

        while true 
            print "\n#{@name} -> insert position of the piece you wish to move (e.g: a5): "
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

            if piece.availableMoves(board).empty?
                system("clear")
                board.displayBoard()
                puts "\nno available moves for this piece"
                next
            end

            break 
        end

        system("clear")
        board.displayBoard()
        
        puts "you will move #{piece.type} in #{choosenSquare.name}"
        return choosenSquare
    end

    def chooseTarget(board,origin)

        piece = origin.occupiedBy

        while true
            puts "\ninsert the position you want #{piece.type} at #{origin.name} to move to"
            target = gets.chomp

            unless board.squareInBoard?(target)
                system("clear")
                board.displayBoard()
                puts "\ninvalid position, try again"
                next
            end

            choosenSquare = board.getSquare(target)
        
            unless piece.availableMoves(board).include?([choosenSquare.pos.x,choosenSquare.pos.y])
                system("clear")
                board.displayBoard()
                puts "\nyou can't move the piece to that position"
                next
            end

            break
        end

        #// set piece to the chooseSquare position
        origin.occupiedBy = nil
        choosenSquare.occupiedBy = piece
        choosenSquare.occupiedBy.pos.x = choosenSquare.pos.x
        choosenSquare.occupiedBy.pos.y = choosenSquare.pos.y
    end

  

end

