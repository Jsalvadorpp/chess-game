require "./board"
require  "./player"
require 'io/console'
require_relative "pieces/rook"
require_relative "pieces/knight"
require_relative "pieces/king"
require_relative "pieces/queen"
require_relative "pieces/bishop"
require_relative "pieces/pawn"

class Game
    def initialize
        @board = Board.new
        newGame()
        gameLoop()
    end

    def newGame         #set each piece on board
        #black pieces
        setPiecesOnBoard("black")
        #white pieces
        setPiecesOnBoard("white")

        system("clear")
        @board.displayBoard()
    end

    def gameLoop

        player1 = Player.new("white")
        player2 = Player.new("black")

        while true

            #// player 1 turn
            if player1.checkmate?(@board) != "none"
                gameStatus = player1.checkmate?(@board)
                winner = player2.name
                break
            end
            player1.playerTurn(@board)
        
            #// player 2 turn
            if player2.checkmate?(@board) != "none"
                gameStatus = player2.checkmate?(@board)
                winner = player1.name
                break
            end
            player2.playerTurn(@board)

        end

        system("clear")
        @board.displayBoard()
        puts "\nPlayer #{winner} won !!" if gameStatus == "checkmate"
        puts "\nit's a Draw" if gameStatus == "stalemate"

    end

    def setPiecesOnBoard(color)
        kingRow = (color == "black" ) ? 0 : 7
        pawsRow = (color == "black" ) ? 1 : 6
        piecesKingRow = [Rook,Knight,Bishop,King,Queen,Bishop,Knight,Rook]
        piecesKingRow.each_with_index { |piece,index| @board.setPieceAt(piece.new(color),kingRow,index)}
        8.times { |y| @board.setPieceAt(Pawn.new(color),pawsRow,y)}

        array = []
        #// add pieces to an array
        8.times { |y| array.push(@board.getPiece_coords(kingRow,y)) }
        8.times { |y| array.push(@board.getPiece_coords(pawsRow,y)) }

        @board.whitePieces = array if color == "white"
        @board.blackPieces = array if color == "black"
        @board.whiteKing = @board.getPiece_coords(kingRow,3) if color == "white"
        @board.blackKing = @board.getPiece_coords(kingRow,3) if color == "black"
    end

end

chess = Game.new

