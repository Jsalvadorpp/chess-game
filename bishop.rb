require "./piece"

class Bishop < Piece
    def initialize(color)
        super(color,"bishop","B")
    end

    def availableMoves(board)
        moves = []

        x = self.pos.x-1
        y = self.pos.y-1 
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            x = x-1
            y = y-1
        end

        x = self.pos.x+1
        y = self.pos.y-1
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            x = x+1
            y = y-1
        end

        x = self.pos.x-1
        y = self.pos.y+1
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            x = x-1
            y = y+1
        end

        x = self.pos.x+1
        y = self.pos.y+1
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            x = x+1
            y = y+1
        end
        
        return moves
    end
end

