require_relative "./piece"

class Knight < Piece
    def initialize(color)
        super(color,"knight","♞")
    end

    def availableMoves_withoutCheck(board)
        moves = []

        moves.push([self.pos.x+2,self.pos.y-1]) if legalMove(board,self.pos.x+2,self.pos.y-1)
        moves.push([self.pos.x+2,self.pos.y+1]) if legalMove(board,self.pos.x+2,self.pos.y+1)
        moves.push([self.pos.x+1,self.pos.y-2]) if legalMove(board,self.pos.x+1,self.pos.y-2)
        moves.push([self.pos.x+1,self.pos.y+2]) if legalMove(board,self.pos.x+1,self.pos.y+2)

        moves.push([self.pos.x-1,self.pos.y-2]) if legalMove(board,self.pos.x-1,self.pos.y-2)
        moves.push([self.pos.x-1,self.pos.y+2]) if legalMove(board,self.pos.x-1,self.pos.y+2)
        moves.push([self.pos.x-2,self.pos.y-1]) if legalMove(board,self.pos.x-2,self.pos.y-1)
        moves.push([self.pos.x-2,self.pos.y+1]) if legalMove(board,self.pos.x-2,self.pos.y+1)

        return moves
    end

end