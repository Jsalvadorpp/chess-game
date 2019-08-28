require "./board"
require "./rook"
require "./knight"
require "./king"
require "./queen"
require "./bishop"
require "./pawn"

class Game
    def initialize
        @board = Board.new
        newGame()
    end

    def newGame
        #set each piece on board

        #black pieces
        setPiecesOnBoard("black")
        #white pieces
        setPiecesOnBoard("white")

        @board.displayBoard()

    end

    def setPiecesOnBoard(color)
        kingRow = (color == "black" ) ? 0 : 7
        pawsRow = (color == "black" ) ? 1 : 6
        piecesKingRow = [Rook,Knight,Bishop,King,Queen,Bishop,Knight,Rook]
        piecesKingRow.each_with_index { |piece,index| @board.setPieceAt(piece.new(color),kingRow,index)}
        8.times { |y| @board.setPieceAt(Pawn.new(color),pawsRow,y)}
    end

end

chess = Game.new

