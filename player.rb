require 'io/console'
require './board'

class Player
    attr_reader :name , :color

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
        system("clear")
        board.displayBoard()
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

            if piece.allAvailableMoves(board).empty?
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
        
            unless piece.allAvailableMoves(board).include?([choosenSquare.pos.x,choosenSquare.pos.y])
                system("clear")
                board.displayBoard()
                puts "\nyou can't move the piece to that position"
                next
            end

            break
        end

        #// set piece to the chooseSquare position
        origin.occupiedBy = nil
        board.eliminateFromGame(choosenSquare.occupiedBy) if choosenSquare.occupiedBy != nil
        choosenSquare.occupiedBy = piece
        choosenSquare.occupiedBy.pos.x = choosenSquare.pos.x
        choosenSquare.occupiedBy.pos.y = choosenSquare.pos.y
    end

    def checkmate?(board)

        check = board.check?(board,@color)

        puts "\n #{@color} king is in check" if check

        playerPieces = (@color == "white") ? board.whitePieces : board.blackPieces
        playerAvailableMoves = []
        
        playerPieces.each{|piece| playerAvailableMoves.push(piece.allAvailableMoves(board)) unless piece.allAvailableMoves(board).empty?}

        if check && playerAvailableMoves.empty?
            return "checkmate" 
        elsif playerAvailableMoves.empty? && !check
            return "stalemate"
        else
            return "none"
        end

    end

  

end

