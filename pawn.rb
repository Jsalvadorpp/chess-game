require "./piece"

class Pawn < Piece
    def initialize(color)
        super(color,"pawn","P")
    end

    def availableMoves_withoutCheck(board)
        moves = []
        
        x = self.pos.x
        y = self.pos.y

        if self.color == "white"
            moves.push([x-1,y]) if legalMove(board,x-1,y) 
            moves.push([x-2,y]) if x == 6 && legalMove(board,x-2,y) && legalMove(board,x-1,y) 

            moves.push([x-1,y-1]) if pawnLegalMove(board,x-1,y-1)
            moves.push([x-1,y+1]) if pawnLegalMove(board,x-1,y+1)
        else
            moves.push([x+1,y]) if legalMove(board,x+1,y) 
            moves.push([x+2,y]) if x == 1 && legalMove(board,x+2,y) && legalMove(board,x+1,y) 

            moves.push([x+1,y-1]) if pawnLegalMove(board,x+1,y-1)
            moves.push([x+1,y+1]) if pawnLegalMove(board,x+1,y+1)
        end

        return moves
    end

    def legalMove(board,x,y)
        return false unless board.squareInBoard_coords(x,y)
        return (board.getPiece_coords(x,y).nil?) ? true : false
    end

    def pawnLegalMove(board,x,y)
        return false unless board.squareInBoard_coords(x,y)

        if board.getPiece_coords(x,y) != nil 
            return (board.getPiece_coords(x,y).color == self.color) ? false : true
        end

        return false
    end


end