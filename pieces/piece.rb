require_relative "../square"
require "colorize"
require_relative "../board"

class Piece
    attr_reader :color, :type , :symbol
    attr_accessor :pos

    def initialize(color,type,symbol)
        @color = color
        @type = type
        @pos = PositionInBoard.new(nil,nil)
        @symbol = @color == "black" ? "  #{symbol}  ".colorize(:white).on_black : "  #{symbol}  ".colorize(:black).on_white
    end

    def availableMoves_withoutCheck
        raise NotImplementedError, "you must implement the method"
    end

    def legalMove(board,x,y)
        return false unless board.squareInBoard_coords(x,y)
        return true if board.getPiece_coords(x,y) == nil
        return (board.getPiece_coords(x,y).color == self.color) ? false : true
    end

    def allAvailableMoves(board)
        moves = availableMoves_withoutCheck(board)
        moves.select! { |move| board.kingIntoCheck(self,move[0],move[1]) == false}
        return moves
    end
    
end

