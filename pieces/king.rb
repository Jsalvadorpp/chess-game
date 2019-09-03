require_relative "./piece"

class King < Piece
    def initialize(color)
        super(color,"king","♚")
    end

    def availableMoves_withoutCheck(board)
        moves = []

        x = self.pos.x
        y = self.pos.y

        moves.push([x-1,y-1]) if legalMove(board,x-1,y-1)
        moves.push([x-1,y]) if legalMove(board,x-1,y)
        moves.push([x-1,y+1]) if legalMove(board,x-1,y+1)

        moves.push([x,y-1]) if legalMove(board,x,y-1)
        moves.push([x,y+1]) if legalMove(board,x,y+1)

        moves.push([x+1,y-1]) if legalMove(board,x+1,y-1)
        moves.push([x+1,y]) if legalMove(board,x+1,y)
        moves.push([x+1,y+1]) if legalMove(board,x+1,y+1)

        return moves
    end
end