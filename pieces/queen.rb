require_relative "./piece"

class Queen < Piece
    def initialize(color)
        super(color,"queen","♛")
    end

    def availableMoves_withoutCheck(board)
        moves = []

        x = self.pos.x
        y = self.pos.y + 1 
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            y = y+1
        end

        y = self.pos.y - 1 
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            y = y-1
        end

        x = self.pos.x + 1
        y = self.pos.y
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            x = x+1
        end

        x = self.pos.x - 1
        while legalMove(board,x,y)
            moves.push([x,y])
            break if board.getPiece_coords(x,y) != nil
            x = x-1
        end

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