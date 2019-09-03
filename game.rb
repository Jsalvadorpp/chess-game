require "./board"
require "./rook"
require "./knight"
require "./king"
require "./queen"
require "./bishop"
require "./pawn"
require "./player"
require 'io/console'

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
            player1.playerTurn(@board)
            system("clear")
            @board.displayBoard()
            player2.playerTurn(@board)
            system("clear")
            @board.displayBoard()
        end

    end

    def setPiecesOnBoard(color)
        kingRow = (color == "black" ) ? 0 : 7
        pawsRow = (color == "black" ) ? 1 : 6
        piecesKingRow = [Rook,Knight,Bishop,King,Queen,Bishop,Knight,Rook]
        piecesKingRow.each_with_index { |piece,index| @board.setPieceAt(piece.new(color),kingRow,index)}
        #8.times { |y| @board.setPieceAt(Pawn.new(color),pawsRow,y)}

        array = []
        #// add pieces to an array
        8.times { |y| array.push(@board.getPiece_coords(kingRow,y)) }
        #8.times { |y| array.push(@board.getPiece_coords(pawsRow,y)) }

        @board.whitePieces = array if color == "white"
        @board.blackPieces = array if color == "black"
        @board.whiteKing = @board.getPiece_coords(kingRow,3) if color == "white"
        @board.blackKing = @board.getPiece_coords(kingRow,3) if color == "black"


    end

end

chess = Game.new

